return {
	"letieu/jira.nvim",
	opts = {
		-- Your setup options...
		jira = {
			limit = 200, -- Global limit of tasks per view (default: 200)
		},

		-- Saved JQL queries for the JQL tab
		-- Use %s as a placeholder for the project key
		queries = {
			--			["Next sprint"] = "project = '%s' AND sprint in futureSprints() ORDER BY Rank ASC",
			--			["Backlog"] = "project = '%s' AND (issuetype IN standardIssueTypes() OR issuetype = Sub-task) AND (sprint IS EMPTY OR sprint NOT IN openSprints()) AND statusCategory != Done ORDER BY Rank ASC",
			--			["My Tasks"] = "assignee = currentUser() AND statusCategory != Done ORDER BY updated DESC",
		},
	},
}
