# hosts_templated

A cookbook to manage the /etc/hosts file. This uses chef templates rather than
sed/grep and so on to add entries as needed. Use either this or the hosts
cookbook, but not both.

Usage:

 * Include the recipe in your run_list:

        run_list(
            "recipe[hosts_templated]",
            ...
        )

 * Set values for node[:hosts][:entries] in your role:

        override_attributes(
            :hosts => {
                :enabled => true, # Set to false to disable cookbook
                :entries => {
                    "foo foo.int.domain.com" => "1.2.3.4",
                    "bar" => "1.2.3.5",
                    "baz loghost" => "1.2.3.6"
                }
            }
        )

 * Macro substitution is allowed in entries. Format is:

        "{ruby_expression}"

   * Any code inside the {} will be eval'd
