# Nice Partials Usage Guide

## Basic Usage
1. Create partials in `app/views/shared/`
2. Use `render` with standard Rails syntax:

```ruby
<%= render "shared/card", title: "My Card" do %>
  Card content
<% end %>
```

## Naming Convention
- Partial: `_card.html.erb`
- Path: `shared/card`

## Passing Variables
```ruby
<%= render "shared/stat_block", title: "Total", value: 100 %>
```

## Nesting
Partials can be nested within each other.

## Benefits
- Cleaner, more readable view code
- Reusable components
- Easier testing and maintenance

## Best Practices
- Keep partials focused and single-purpose
- Use meaningful names
- Document complex partials
- Follow Rails conventions for partial naming and rendering
