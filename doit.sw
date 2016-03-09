// object ometa

mixed *table;
mapping *rules;
mapping *rule_exps;

int add_rule(string name, string value, string work) {
	if (rules{name}) {
		write("Error rule: " + name + " already exists.\n");
		return 0;
	}

	rules{name} = value;
	rules_exps{name} = work;
	return 1;
}

setup() {
	rules = ();
	table = ();
	rule_exps = ();
}

