return {
  'kyazdani42/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      override = {
        -- Folders
        folder = { icon = "", color = "#7ebae4", name = "Folder" },

        -- Programming languages
        js = { icon = "󰌞", color = "#f1e05a", name = "JavaScript" },
        jsx = { icon = "󰜈", color = "#61dafb", name = "JSX" },
        ts = { icon = "󰛦", color = "#3178c6", name = "TypeScript" },
        tsx = { icon = "󰜈", color = "#61dafb", name = "TSX" },
        py = { icon = "󰌠", color = "#3776ab", name = "Python" },
        pyc = { icon = "󰌠", color = "#3776ab", name = "PythonCompiled" },
        lua = { icon = "󰢱", color = "#000080", name = "Lua" },
        rb = { icon = "󰴭", color = "#cc342d", name = "Ruby" },
        go = { icon = "󰟓", color = "#00add8", name = "Go" },
        rs = { icon = "󱘗", color = "#dea584", name = "Rust" },
        java = { icon = "󰬷", color = "#b07219", name = "Java" },
        c = { icon = "󰙱", color = "#555555", name = "C" },
        cpp = { icon = "󰙲", color = "#f34b7d", name = "CPP" },
        cs = { icon = "󰌛", color = "#178600", name = "CSharp" },
        php = { icon = "󰌟", color = "#4f5d95", name = "PHP" },
        swift = { icon = "󰛥", color = "#ffac45", name = "Swift" },
        kt = { icon = "󱈙", color = "#7f52ff", name = "Kotlin" },
        dart = { icon = "󰯲", color = "#0175c2", name = "Dart" },

        -- Web & markup
        html = { icon = "󰌝", color = "#e34c26", name = "HTML" },
        css = { icon = "󰌜", color = "#563d7c", name = "CSS" },
        scss = { icon = "󰟬", color = "#c6538c", name = "SCSS" },
        sass = { icon = "󰟬", color = "#c6538c", name = "SASS" },
        less = { icon = "󰌜", color = "#1d365d", name = "LESS" },
        json = { icon = "󰘦", color = "#cbcb41", name = "JSON" },
        xml = { icon = "󰗀", color = "#e37933", name = "XML" },
        yaml = { icon = "󰈙", color = "#cb171e", name = "YAML" },
        yml = { icon = "󰈙", color = "#cb171e", name = "YML" },
        toml = { icon = "󰈙", color = "#9c4221", name = "TOML" },

        -- Configuration & build
        dockerfile = { icon = "󰡨", color = "#384d54", name = "Dockerfile" },
        makefile = { icon = "", color = "#6d8086", name = "Makefile" },

        -- Documentation
        md = { icon = "󰍔", color = "#519aba", name = "Markdown" },
        txt = { icon = "󰈙", color = "#89e051", name = "Text" },
        pdf = { icon = "󰈦", color = "#b30b00", name = "PDF" },

        -- Shell & scripts
        sh = { icon = "", color = "#89e051", name = "Shell" },
        bash = { icon = "", color = "#89e051", name = "Bash" },
        zsh = { icon = "", color = "#89e051", name = "Zsh" },
        fish = { icon = "", color = "#89e051", name = "Fish" },

        -- Database
        sql = { icon = "󰆼", color = "#dad8d8", name = "SQL" },
        db = { icon = "󰆼", color = "#dad8d8", name = "Database" },
        sqlite = { icon = "󰆼", color = "#003b57", name = "SQLite" },

        -- Images
        png = { icon = "󰋩", color = "#a074c4", name = "PNG" },
        jpg = { icon = "󰋩", color = "#a074c4", name = "JPG" },
        jpeg = { icon = "󰋩", color = "#a074c4", name = "JPEG" },
        gif = { icon = "󰋩", color = "#a074c4", name = "GIF" },
        svg = { icon = "󰜡", color = "#ffb13b", name = "SVG" },
        ico = { icon = "󰋩", color = "#cbcb41", name = "ICO" },
        webp = { icon = "󰋩", color = "#a074c4", name = "WEBP" },

        -- Archives
        zip = { icon = "󰗄", color = "#eca517", name = "Zip" },
        tar = { icon = "󰗄", color = "#eca517", name = "Tar" },
        gz = { icon = "󰗄", color = "#eca517", name = "Gzip" },

        -- Misc
        vim = { icon = "", color = "#019833", name = "Vim" },
        lock = { icon = "󰌾", color = "#bbbbbb", name = "Lock" },
        log = { icon = "󰌱", color = "#ffffff", name = "Log" },
      },

      -- Default icon for unknown file types
      default = true,

      -- Strictly match extension (don't try to guess)
      strict = true,
    }
  end
}
