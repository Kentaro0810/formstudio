PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS forms (
 id TEXT PRIMARY KEY, slug TEXT NOT NULL UNIQUE, title TEXT NOT NULL, description TEXT NOT NULL DEFAULT '', status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','open','closed')), theme TEXT NOT NULL DEFAULT '#2563eb', success_message TEXT NOT NULL DEFAULT '回答を受け付けました。', response_limit INTEGER, starts_at TEXT, ends_at TEXT, created_at TEXT NOT NULL, updated_at TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS questions (
 id TEXT PRIMARY KEY, form_id TEXT NOT NULL, label TEXT NOT NULL, type TEXT NOT NULL CHECK(type IN ('text','textarea','radio','checkbox','select','number','date','time','email','url','rating','consent')), required INTEGER NOT NULL DEFAULT 0, position INTEGER NOT NULL, options_json TEXT NOT NULL DEFAULT '[]', help_text TEXT NOT NULL DEFAULT '', FOREIGN KEY(form_id) REFERENCES forms(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS responses (
 id TEXT PRIMARY KEY, form_id TEXT NOT NULL, submitted_at TEXT NOT NULL, fingerprint TEXT, FOREIGN KEY(form_id) REFERENCES forms(id) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS answers (
 id TEXT PRIMARY KEY, response_id TEXT NOT NULL, question_id TEXT NOT NULL, value_json TEXT NOT NULL, FOREIGN KEY(response_id) REFERENCES responses(id) ON DELETE CASCADE, FOREIGN KEY(question_id) REFERENCES questions(id) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_questions_form ON questions(form_id, position);
CREATE INDEX IF NOT EXISTS idx_responses_form ON responses(form_id, submitted_at DESC);
CREATE INDEX IF NOT EXISTS idx_answers_response ON answers(response_id);
