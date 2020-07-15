local param_job(script, parallel_count) =
  {
    image: "alpine:latest",
    script: script,
    parallel: parallel_count,
    rules: [
      { "if": "$CI_COMMIT_BRANCH" }
    ]
  };

{
  "rspec": param_job("echo Hello World", 2),
  "rspec 2": param_job("echo Hello World 2", 2)
}
