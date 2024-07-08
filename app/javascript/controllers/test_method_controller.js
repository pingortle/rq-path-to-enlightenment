import { Controller } from '@hotwired/stimulus'
import { File, OpenFile, PreopenDirectory, WASI } from '@bjorn3/browser_wasi_shim'

export default class extends Controller {
  static targets = ['code', 'output']

  connect () {
    this.vm = this.createRubyVM()
  }

  async run (event) {
    const result = await (await this.vm).evalAsync(this.rubyCode)
      .catch(e => {
        this.outputTarget.textContent += e
        return e
      })

    this.outputTarget.textContent += result
  }

  get rubyCode () {
    return `
    ${this.codeTarget.textContent}
    `
  }

  get codePreamble () {
    return `
    require "js"
    $stdout = Object.new.tap do |obj|
        def obj.write(str)
          JS.global[:console].log("from ruby!", str)
        end
      end

    $stderr = Object.new.tap do |obj|
        def obj.write(str)
          JS.global[:console].error("from ruby!", str)
        end
      end
      `
  }

  async createRubyVM () {
    const { RubyVM, consolePrinter } = await this.importUMD('https://cdn.jsdelivr.net/npm/@ruby/wasm-wasi@2.6.2/dist/index.umd.js')

    const args = []
    const env = []
    const fds = [
      new OpenFile(new File([])),
      new OpenFile(new File([])),
      new OpenFile(new File([])),
      new PreopenDirectory('/', new Map())
    ]
    const wasi = new WASI(args, env, fds, { debug: false })
    const vm = new RubyVM()

    const imports = {
      wasi_snapshot_preview1: wasi.wasiImport
    }
    vm.addToImports(imports)
    const printer = consolePrinter({
      stdout: this.stdout.bind(this),
      stderr: this.stderr.bind(this)
    })
    printer.addToImports(imports)

    const module = await WebAssembly.compileStreaming( // eslint-disable-line no-undef
      fetch('https://cdn.jsdelivr.net/npm/@ruby/3.3-wasm-wasi@2.6.2/dist/ruby.wasm')
    )
    const instance = await WebAssembly.instantiate( // eslint-disable-line no-undef
      module,
      imports
    )
    await vm.setInstance(instance)

    printer.setMemory(instance.exports.memory)

    wasi.initialize(instance)
    vm.initialize()

    return vm
  }

  stdout (str) {
    this.outputTarget.textContent += str
  }

  stderr (str) {
    this.outputTarget.textContent += str
  }

  async importUMD (url, module = { exports: {} }) {
    return (
      Function( // eslint-disable-line no-new-func
        'module',
        'exports',
        await (
          await fetch(url)
        ).text()
      ).call(module, module, module.exports), module).exports
  }
}
