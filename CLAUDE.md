# CLAUDE.md

Guidance for Claude Code when working with rabbitmq-stream-perf-test.

## Project Overview

**RabbitMQ Stream Performance Test** – A Java-based performance testing suite for RabbitMQ Stream queues, providing benchmarking tools with monitoring, metrics collection, and distributed testing capabilities.

**Type**: POC / Platform Tool
**Purpose**: Benchmark RabbitMQ Stream queue performance under various load conditions
**Status**: Active (v1.5.0)

### Key Features

- Stream protocol performance testing
- Prometheus metrics collection and monitoring
- Distributed load testing with JGroups
- Command-line CLI with picocli
- Docker support for containerized testing
- AsciiDoc documentation

---

## Project Structure

```
rabbitmq-stream-perf-test/
├── src/
│   ├── main/java/com/rabbitmq/stream/perf/
│   │   ├── StreamPerfTest.java          # Main CLI entry point
│   │   ├── PerformanceMetrics.java      # Metrics collection
│   │   ├── Monitoring.java              # Monitoring interface
│   │   ├── PrometheusEndpointMonitoring.java  # Prometheus integration
│   │   └── ... (various utilities)
│   ├── test/java/com/rabbitmq/stream/perf/  # JUnit test suite
│   ├── docs/asciidoc/          # AsciiDoc documentation
│   └── resources/              # Configuration files
├── pom.xml                     # Maven build configuration
├── Dockerfile                  # Docker image definition
├── README.adoc                 # AsciiDoc format documentation
└── ci/                         # CI/CD scripts
```

**Key Files**:
- `src/main/java/com/rabbitmq/stream/perf/StreamPerfTest.java` - Main entry point
- `pom.xml` - Maven dependencies and build config
- `README.adoc` - Full documentation in AsciiDoc

---

## Common Workflows

### Build

```bash
./mvnw clean package
```

Maven builds JAR artifact.

### Run Performance Test

```bash
java -jar target/stream-perf-test-1.5.0.jar [options]
```

See documentation in `src/docs/asciidoc/` for detailed usage options.

### Docker Build

```bash
docker build -t rabbitmq-stream-perf-test:1.5.0 .
```

### Run Tests

```bash
./mvnw test
```

JUnit test suite for validation.

---

## Dependencies

**Build**:
- **Maven** - Build system
- **JDK 11+** - Java runtime

**Runtime**:
- **RabbitMQ Stream Protocol** - Stream queue support
- **Prometheus Client Library** - Metrics export
- **JGroups** - Distributed testing (optional)
- **Picocli** - CLI framework

**Monitoring**:
- **Prometheus** - Metrics collection
- **Grafana** - Dashboard visualization (docker/)

---

## Important Conventions

- Entry point: `com.rabbitmq.stream.perf.StreamPerfTest`
- Use `./mvnw` (not `mvn`) to ensure correct version
- Configuration via `src/main/resources/rabbitmq-stream-perf-test.properties`
- Metrics exposed on Prometheus endpoint (configurable)
- JGroups configuration in `src/main/resources/jgroups-*.xml`

---

## Docker Setup

Docker and Docker Compose configurations available in this repo:

- `docker/docker-compose-rabbitmq-stack.yml` - RabbitMQ broker setup
- `docker/docker-compose-stream-load-test.yml` - Load test environment
- `docker/grafana/` - Pre-built Grafana dashboards for visualization

---

## Troubleshooting

### Build Fails

```bash
./mvnw clean
./mvnw package
```

### Connection Refused

Check RabbitMQ broker is running and accessible on configured host:port.

### Metrics Not Appearing

Verify Prometheus endpoint is enabled and accessible (default: localhost:8080).

---

## Notes for Claude Code

When working on this project:

1. Use `./mvnw` for builds (ensures Maven wrapper version)
2. Performance tests may take time - plan accordingly
3. Prometheus metrics require monitoring setup (docker-compose available)
4. JGroups configuration affects distributed test behavior
5. Check `src/docs/asciidoc/` for detailed usage guide
6. Release versions defined in `release-versions.txt`
