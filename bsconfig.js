{
  "name": "your-project-name",
  "sources": [
    {
      "dir": "src", // update this to wherever you're putting ReScript files
      "subdirs": true
    }
  ],
  "package-specs": [
    {
      "module": "es6",
      "in-source": true
    }
  ],
  "suffix": ".bs.js",
  "bs-dependencies": ["@rescript/react"]
  "reason": { "react-jsx": 3 },
}
