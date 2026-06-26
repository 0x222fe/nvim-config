vim.lsp.config("roslyn", {
    on_attach = function() end,
    settings = {
        -- Background Analysis
        ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "fullSolution",
            dotnet_compiler_diagnostics_scope = "fullSolution",
        },
        -- Code Lens
        ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
            dotnet_enable_tests_code_lens = true,
        },
        -- Completions
        ["csharp|completion"] = {
            dotnet_show_name_completion_suggestions = true,
            dotnet_provide_regex_completions = true,
            dotnet_show_completion_items_from_unimported_namespaces = true,
        },
        -- Inlay Hints
        ["csharp|inlay_hints"] = {
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
            csharp_enable_inlay_hints_for_types = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
        },
        -- Symbol Search
        ["csharp|symbol_search"] = {
            dotnet_search_reference_assemblies = true,
        },
        -- Type Members
        ["csharp|type_members"] = {
            dotnet_member_insertion_location = "withOtherMembersOfTheSameKind",
            dotnet_property_generation_behavior = "preferAutoProperties",
        },
        -- Quick Info
        ["csharp|quick_info"] = {
            dotnet_show_remarks_in_quick_info = true,
        },
        -- Navigation
        ["navigation"] = {
            dotnet_navigate_to_decompiled_sources = true,
        },
        -- Highlighting
        ["csharp|highlighting"] = {
            dotnet_highlight_related_regex_components = true,
            dotnet_highlight_related_json_components = true,
        },
        -- Auto Insert
        ["csharp|auto_insert"] = {
            dotnet_enable_auto_insert = true,
        },
        -- Formatting
        ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
        },
    },
})

