--
-- Copyright © 2021 the Konveyor Contributors (https://konveyor.io/)
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

update category set name='Application details' where name='Application Details';
update question set description ='How much knowledge does the team have about the application''s development or usage?' where description='How much knowledge does the team have regarding the development or usage of the application';
update single_option set option='Little knowledge, no development (example: third-party or commercial off-the-shelf application)' where option='External 3rd party or COTS application ';
update single_option set option='Maintenance mode, no SME knowledge or adequate documentation available' where option='In maintenance mode, no app SME knowledge, poor documentation';
update single_option set option='Maintenance mode, SME knowledge is available' where option='Maintenance mode, SME knowledge available';
update single_option set option='Actively developed, SME knowledge is available' where option='Actively developed, SME knowledge available';
update single_option set option='Greenfield application' where option='New Greenfield application';
update question set question_text ='How is the application supported in production?' where question_text='How is the application supported in Production?';
update question set description ='Does the team have sufficient knowledge to support the application in production?' where description='How much knowledge does the team have to support the application in production';
update single_option set option='External support provider with a ticket-driven escalation process; no inhouse support resources' where option='Application production support outsourced to 3rd party support provider. Ticket driven escalation process, no inhouse support resources.';
update single_option set option='Separate internal support team, separate from the development team, with little interaction between the teams' where option='Production support provided by separate internal team, little interaction with development team.';
update single_option set option='Multiple teams provide support using an established escalation model' where option='Multiple teams support the application using an established escalation model';
update single_option set option='SRE (Site Reliability Engineering) approach with a knowledgeable and experienced operations team' where option='SRE based approach with knowledgeable and experienced operations team';
update single_option set option='DevOps approach with the same team building the application and supporting it in production' where option='Pure DevOps model, the team that builds it is responsible for running it in Production';
update question set question_text ='How much time passes from when code is committed until the application is deployed to production?' where question_text='How long does it take from when code is committed to it being deployed to a stage that is production ready?';
update question set description ='What is the development latency?' where description='Gauge the development latency';
update single_option set option='More than 6 months' where option='More than six months';
update single_option set option='2-6 months' where option='Between one month and six months';
update single_option set option='8-30 days' where option='Between one week and one month';
update single_option set option='1-7 days' where option='Between one day and one week';
update single_option set option='Less than 1 day' where option='Less than one day';
update question set question_text ='How often is the application deployed to production?' where question_text='Deployment frequency';
update question set description='Deployment frequency' where description='Gauge deployment frequency';
update single_option set option='Less than once every 6 months' where option='Greater than once every six months';
update single_option set option='Between once a month and once every 6 months' where option='Between once per month and once every six months';
update single_option set option='Weekly' where option='Weekly deployments';
update single_option set option='Daily' where option='Daily deployments';
update single_option set option='Several times a day' where option='On demand (multiple deploys per day)';
update question set question_text ='What is the application''s mean time to recover (MTTR) from failure in a production environment?' where question_text='What is the Mean Time to Recover (MTTR) when a fault is found with the application in production?';
update question set description ='Average time for the application to recover from failure' where description='Gauge the problem resolution time, MTTR (mean time to recover) is the average time it takes to repair/recover a system';
update single_option set option='1 month or more' where option='One month or greater';
update single_option set option='1-7 days' where option='Between one day and one week';
update single_option set option='1-24 hours' where option='Between one hour and one day';
update single_option set option='Less than 1 hour' where option='Less than one hour';
update question set question_text ='Does the application have legal and/or licensing requirements?' where question_text='Does the application have any legal compliance requirements? e.g. PCI, HIPAA etc. Does the application have any licensing requirements? e.g. per core licensing';
update question set description ='Legal and licensing requirements must be assessed to determine their possible impact (cost, fault reporting) on the container platform hosting the application. Examples of legal requirements: isolated clusters, certifications, compliance with the Payment Card Industry Data Security Standard or the Health Insurance Portability and Accountability Act. Examples of licensing requirements: per server, per CPU.' where description='Assess the level of compliance and licensing required, think about what impact this will have when using a container platform to host the applications e.g. cost, fault reporting etc';
update single_option set option='Multiple legal and licensing requirements' where option='High compliance requirements - both Legal and licensing';
update single_option set option='Licensing requirements (examples: per server, per CPU)' where option='Licensing compliance - licensing servers';
update single_option set option='Legal requirements (examples: cluster isolation, hardware, PCI or HIPAA compliance)' where option='Legal compliance - distinct hardware, isolated clusters, compliance certification';
update single_option set option='None' where option=' None';
update question set question_text ='Which model best describes the application architecture?' where question_text='Which statement best describes the application architecture?';
update question set description ='Describe the application architecture in simple terms.' where description='In simple terms describe the application architecture';
update single_option set option='Massive monolith (high memory and CPU usage), singleton deployment, vertical scale only' where option='Massive Monolith (high memory, high CPU), singleton deployment, vertical scale only';
update single_option set option='Massive monolith (high memory and CPU usage), non-singleton deployment, complex to scale horizontally' where option='Massive Monolith (high memory, high CPU), non singleton, complex to scale horizontally';
update single_option set option='Complex monolith, strict runtime dependency startup order, non-resilient architecture' where option='Complex Monolith -  strict runtime dependency startup order, non resilient architecture';
update single_option set option='Resilient monolith (examples: retries, circuit breakers)' where option='Modern resilient monolith e.g. retries, circuit breaker etc';
update category set name='Application dependencies' where name='Application Dependencies';
update question set question_text ='Does the application require specific hardware?' where question_text='Does the application require specific hardware capabilities to run?';
update question set description ='OpenShift Container Platform runs only on x86, IBM Power, or IBM Z systems' where description='OpenShift only runs on X86 and IBM Power/Z systems';
update single_option set option='Requires CPU that is not supported by Red Hat' where option='Non supported CPU requirements';
update single_option set option='Requires custom or legacy hardware (example: USB device)' where option='Custom or legacy hardware required';
update single_option set option='Requires specific computer hardware (examples: GPUs, RAM, HDDs)' where option='GPU, specific worker node hardware requirements';
update single_option set option='Requires CPU that is supported by Red Hat' where option='Supported CPU requirements';
update question set description ='Only Linux and certain Microsoft Windows versions are supported in containers. Check the latest versions and requirements.' where description='Only Linux and certain versions of Windows are supported in containers. Check the latest versions and requirements';
update single_option set option='Operating system that is not compatible with OpenShift Container Platform (examples: OS X, AIX, Unix, Solaris)' where option='Non-supported Operating Systems - OSX, AIX, UNIX, SOLARIS';
update single_option set option='Linux with custom kernel drivers or a specific kernel version' where option='Linux with custom kernel drivers or specific kernel version';
update single_option set option='Linux with custom capabilities (examples: seccomp, root access)' where option='Linux with custom capabilities e.g. setcomp, root access';
update single_option set option='Standard Linux distribution' where option='Standard Linux';
update question set question_text ='Does the vendor provide support for a third-party component running in a container?' where question_text='Are 3rd party/Vendor components supported in containers?';
update question set description ='Will the vendor support a component if you run it in a container?' where description='While you can potentially run anything in a container doesn''t mean that the vendor will support it';
update single_option set option='Not recommended to run the component in a container' where option='Not recommended to run component in containers';
update single_option set option='No vendor support for containers' where option='Component not supported by vendor when running in a container';
update single_option set option='Vendor supports containers but with limitations (examples: functionality is restricted, component has not been tested)' where option='Supported but with restricted functionality/untested';
update single_option set option='Vendor supports their application running in containers but you must build your own images' where option='Supported but relies on self built images';
update single_option set option='Vendor fully supports containers, provides certified images' where option='Fully vendor supported, certified images available';
update single_option set option='No third-party components required' where option='No 3rd party components required';
update question set question_text ='Incoming/northbound dependencies' where question_text='Dependencies - (Incoming/Northbound)';
update question set description ='Systems or applications that call the application' where description='Systems/Applications that calls the assessed application';
update single_option set option='Dependencies are difficult or expensive to change because they are legacy or third-party' where option='Difficult/Expensive to change dependent systems - legacy, 3rd party, external';
update single_option set option='Many dependencies exist, can be changed but the process is expensive and time-consuming' where option='Many dependent systems, possible to change but expensive and time consuming';
update single_option set option='Many dependencies exist, can be changed because the systems are internally managed' where option='Many dependent systems, possible to change as they''re internally managed';
update single_option set option='No incoming/northbound dependencies' where option='No dependent systems';
update question set question_text ='Outgoing/southbound dependencies' where question_text='Dependencies - (Outgoing/Southbound)';
update question set description ='Systems or applications that the application calls' where description='Systems/Applications that the assessed application calls';
update single_option set option='Dependency availability only verified when application is processing traffic' where option='Availability only verified when processing traffic';
update single_option set option='Dependencies require a complex and strict startup order' where option='Complex strict startup order required';
update single_option set option='Application not ready until dependencies are verified available' where option='Application not ready until dependencies are verified available ';
update single_option set option='Limited processing available if dependencies are unavailable' where option='Limited processing available if dependencies are unavailable';
update single_option set option='No outgoing/southbound dependencies' where option='No dependencies';
update category set name='Application architecture' where name='Application Architecture';
update question set question_text ='How resilient is the application? How well does it recover from outages and restarts?' where question_text='How resilient is the application and how well does it recover from outages/restarts?';
update question set description ='If the application or one of its dependencies fails, how does the application recover from failure? Is manual intervention required?' where description='If the assessed application or one of its dependencies fails how does the application currently recover from the failure and is manual intervention required ';
update single_option set option='Application cannot be restarted cleanly after failure, requires manual intervention' where option='Application cannot be restarted cleanly and requires manual intervention';
update single_option set option='Application fails when a soutbound dependency is unavailable and does not recover automatically' where option='Application errors when southbound dependencies are unavailable and doesn''t recover automatically';
update single_option set option='Application functionality is limited when a dependency is unavailable but recovers when the dependency is available' where option='Application functionality limited when dependency is unavailable but recovers once dependency is available';
update single_option set option='Application employs resilient architecture patterns (examples: circuit breakers, retry mechanisms)' where option='Application employs resilient architecture patterns e.g. circuit breaker, retries etc';
update single_option set option='Application containers are randomly terminated to test resiliency; chaos engineering principles are followed' where option='Chaos Engineering principals followed, application containers randomly terminated to test resiliency in production';
update question set description ='What protocols do external clients use to communicate with the application?' where description='How do external clients communicate with the application';
update single_option set option='Non-TCP/IP protocols (examples: serial, IPX, AppleTalk)' where option='Non-IP protocols e.g. serial, IPX, AppleTalk';
update single_option set option='TCP/IP, with host name or IP address encapsulated in the payload' where option='IP based - hostname/ip encapsulated in payload';
update single_option set option='TCP/UDP without host addressing (example: SSH)' where option='TCP/UDP Traffic without host addressing e.g. SSH ';
update single_option set option='TCP/UDP encapsulated, using TLS with SNI header' where option='TCP/UDP encapsulated using SSL with SNI header';
update single_option set option='HTTP/HTTPS' where option='HTTP/HTTPS Web traffic ';
update question set question_text ='How does the application manage its internal state?' where question_text='How does the application handle it''s internal state?';
update question set description ='If the application must manage or retain an internal state, how is this done?' where description='Does the assessed application have internal state that needs to be managed/retained and if so how?';
update single_option set option='Application components use shared memory within a pod' where option='Shared memory between application components';
update single_option set option='State is managed externally by another product (examples: Zookeeper or Red Hat Data Grid)' where option='Managed/Coordinated externally from application e.g. external Zookeeper, data grid etc';
update single_option set option='Disk shared between application instances' where option='Shared disk between application instances';
update single_option set option='Stateless or ephemeral container storage' where option='Stateless/Ephemeral container storage';
update question set question_text ='How does the application handle service discovery?' where question_text='Does the application have any unusual concerns around service discovery?';
update question set description ='How does the application discover services?' where description='How does the application perform service discovery and how is it discovered';
update single_option set option='Uses technologies that are not compatible with Kubernetes (examples: hardcoded IP addresses, custom cluster manager)' where option='Uses proprietary discovery technologies that are not kubernetes suitable e.g. hardcoded ip addresses, custom cluster manager';
update single_option set option='Requires an application or cluster restart to discover new service instances' where option='Application requires restart on cluster changes to discover new service instances';
update single_option set option='Uses technologies that are compatible with Kubernetes but require specific libraries or services (examples: HashiCorp Consul, Netflix Eureka)' where option='Service discovery compatible with kubernetes but requires specific libraries/services e.g. Hashicorp Consul, Netflix Eureka';
update single_option set option='Uses Kubernetes DNS name resolution' where option='Standard kubernetes DNS name resolution';
update question set question_text ='How is the application clustering managed?' where question_text='How is the application clustered?';
update question set description ='Does the application require clusters? If so, how is clustering managed?' where description='Does the application need to be clustered and managed (if required)';
update single_option set option='Manually configured clustering (example: static clusters)' where option='Manually configured clustering mechanism e.g. static clusters';
update single_option set option='Managed by an external off-PaaS cluster manager' where option='Application clustering handled by external off-PAAS cluster manager';
update single_option set option='Managed by an application runtime that is compatible with Kubernetes' where option='Application clustering mostly provided by application runtime using a kubernetes suitable mechanism';

update category set name='Application observability' where name='Application Observability';
update question set question_text ='How does the application use logging and how are the logs accessed?' where question_text='How does the application use logging and how is it accessed?';
update question set description ='How the application logs are accessed' where description='How do we get access the applications logs';
update single_option set option='Logs are unavailable or are internal with no way to export them' where option='No logging available or internal only with no export mechanism';
update single_option set option='Logs are in a custom binary format, exposed with non-standard protocols' where option='Custom binary logs exposed using non-standard protocols';
update single_option set option='Logs are exposed using syslog' where option='Logs exposed via syslog';
update single_option set option='Logs are written to a file system, sometimes as multiple files' where option='Log entries written to filesystem potentially in multiple files';
update single_option set option='Logs are forwarded to an external logging system (example: Splunk)' where option='Application forwards logs to external system e.g. Splunk';
update single_option set option='Logs are configurable (example: can be sent to stdout)' where option='Configurable logging e.g. can be sent to STDOUT';
update question set description ='Are application metrics available, if necessary (example: OpenShift Container Platform collects CPU and memory metrics)?' where description='How do we get access the applications metrics if required, OCP defaults to CPU/Memory metrics';
update single_option set option='No metrics available' where option='No metrics exposed';
update single_option set option='Metrics collected but not exposed externally' where option='Internal metrics but not exposed externally';
update single_option set option='Metrics exposed using binary protocols (examples: SNMP, JMX)' where option='Metrics exposed via binary protocols e.g. SNMP, JMX';
update single_option set option='Metrics exposed using a third-party solution (examples: Dynatrace, AppDynamics)' where option='3rd party metrics solution e.g. Dynatrace, AppDynamics etc';
update single_option set option='Metrics collected and exposed with built-in Prometheus endpoint support' where option='InBuilt Prometheus endpoint support';
update question set question_text ='How easy is it to determine the application''s health and readiness to handle traffic?' where question_text='How easy is it to determine the application health (liveness) and if it''s ready to handle traffic (readiness)?';
update question set description ='How do we determine an application''s health (liveness) and readiness to handle traffic?' where description='How can we determine if the app is ready to handle traffic and if its in good health as opposed to deadlocked/crashed/stuck but without crashing the container';
update single_option set option='Monitored and managed by a custom watchdog process' where option='Custom watchdog process monitoring and managing the application';
update single_option set option='Health is verified by probes running synthetic transactions' where option='Probes execute synthetic transactions to verify application health';
update question set question_text ='What best describes the application''s runtime characteristics?' where question_text='What best describes the applications runtime characteristics?';
update question set description ='How would the profile of an application appear during runtime (examples: graphs showing CPU and memory usage, traffic patterns, latency)? What are the implications for a serverless application?' where description='When running what does the profile of the application resemble e.g. how would it look if the cpu/memory usage was graphed, consider serverless as well';
update single_option set option='Deterministic and predictable real-time execution or control requirements' where option='Deterministic predictable real time execution/control requirements';
update single_option set option='Sensitive to latency (examples: voice applications, high frequency trading applications)' where option='Latency sensitive applications e.g. voice, HFT';
update single_option set option='Constant traffic with a broad range of CPU and memory usage' where option='Constant Traffic, High range of memory/cpu needs';
update single_option set option='Intermittent traffic with predictable CPU and memory usage' where option='Intermittent traffic, predictable CPU/Memory Needs';
update single_option set option='Constant traffic with predictable CPU and memory usage' where option='Constant Traffic, predictable CPU/Memory Needs';
update question set description ='How long the application takes to boot' where description='How long does it take the application to boot';
update single_option set option='More than 5 minutes' where option=' 5+ minutes';
update single_option set option='2-5 minutes' where option=' 2-5 minutes';
update single_option set option='1-2 minutes' where option=' 1-2 minutes';
update single_option set option='10-60 seconds' where option=' > 10 seconds but < 1 minute';
update single_option set option='Less than 10 seconds' where option=' < 10 seconds';
update category set name='Application cross-cutting concerns' where name='Application Cross-Cutting concerns';
update question set question_text ='How is the application tested?' where question_text='What kind of testing does the application undergo?';
update question set description ='Is the application is tested? Is it easy to test (example: automated testing)? Is it tested in production?' where description='Is the application tested, is it easily tested, is it tested in production';
update single_option set option='No testing or minimal manual testing only' where option='None, minimal manual testing only';
update single_option set option='Minimal automated testing, focused on the user interface' where option='Minimal automated testing, UI focused only ';
update single_option set option='Some automated unit and regression testing, basic CI/CD pipeline testing; modern test practices are not followed' where option='Some Automated unit & regression testing, basic CI pipelines, modern test practices not followed';
update single_option set option='Highly repeatable automated testing (examples: unit, integration, smoke tests) before deploying to production; modern test practices are followed' where option='Highly repeatable automated testing - Unit, Integration, smoke tests before production deployment, modern test practices followed';
update single_option set option='Chaos engineering approach, constant testing in production (example: A/B testing + experimentation)' where option='Chaos Engineering principals followed. Constant testing in production e.g. A/B, experimentation';
update question set description ='How is the application configured? Is the configuration method appropriate for a container? External servers are runtime dependencies.' where description='How is the application currently configured and how might that look in a container platform, External servers are runtime dependencies hence AMBER';
update single_option set option='Configuration files compiled during installation and configured using a user interface' where option='Configuration compiled/patched into the application at installation time, application configured via user interface';
update single_option set option='Configuration files are stored externally (example: in a database) and accessed using specific environment keys (examples: host name, IP address)' where option='Externally stored e.g. DB and accessed using specific environment key e.g. hostname, ip address';
update single_option set option='Multiple configuration files in multiple file system locations' where option='Multiple configuration files in multiple filesystem locations';
update single_option set option='Configuration files built into the application and enabled using system properties at runtime' where option='All environment configuration built into the application and enabled via system property at runtime';
update single_option set option='Configuration retrieved from an external server (examples: Spring Cloud Config Server, HashiCorp Consul)' where option='External configuration server e.g. Spring Cloud Config Server, Hashicorp Consul ';
update single_option set option='Configuration loaded from files in a single configurable location; environment variables used' where option='Configuration loaded from files in a single configurable location, environment variables';
update question set question_text ='How does the application acquire security keys or certificates?' where question_text='How does the application acquire the necessary security credentials/certificates?';
update single_option set option='Hardware security modules or encryption devices' where option='HSM, hardware based encryption devices';
update single_option set option='Keys/certificates bound to IP addresses and generated at runtime for each application instance' where option='Certs, Keys bound to application IP addresses, generated at runtime per application instance';
update single_option set option='Keys/certificates compiled into the application' where option='Keys/Certs compiled into application';
update single_option set option='Loaded from a shared disk' where option='Loaded via shared disk';
update single_option set option='Retrieved from an external server (examples: HashiCorp Vault, CyberArk Conjur)' where option='Retrieved from external system e.g. HasiCorp Vault, CyberArk Conjur';
update single_option set option='Loaded from files' where option='Loaded via files';
update single_option set option='Not required' where option='None needed';
update question set question_text ='How is the application deployed?' where question_text='How is the application currently deployed?';
update question set description ='How the application is deployed and whether the deployment process is suitable for a container platform' where description='Understand the current deployment process and how might that look in a container platform';
update single_option set option='Manual deployment using a user interface' where option='Manual documented steps, user interface driven interaction';
update single_option set option='Manual deployment with some automation' where option='Manual documented steps, some basic automation';
update single_option set option='Automated deployment with manual intervention or complex promotion through pipeline stages' where option='Automated deployment, but manual or complex promotion through pipeline stages';
update single_option set option='Automated deployment with a full CI/CD pipeline, minimal intervention for promotion through pipeline stages' where option='Automated deployment, Full CD Pipeline in place, promoting Applications through the pipeline stages with minimal intervention';
update single_option set option='Fully automated (GitOps), blue-green, or canary deployment' where option='GitOps approach and/or B/G + Canary capable';
update question set question_text ='Where is the application deployed?' where question_text='Where is the application currently deployed?';
update question set description ='Where does the application run?' where description='where does the application run';
update single_option set option='Virtual machine (examples: Red Hat Virtualization, VMware)' where option='Virtual machine e.g. Red Hat Virtualisation, VMWare Virtualisation';
update single_option set option='Private cloud (example: Red Hat OpenStack Platform)' where option='Private cloud e.g. OpenStack';
update single_option set option='Public cloud provider (examples: Amazon Web Services, Microsoft Azure, Google Cloud Platform)' where option='Public cloud provider compute instance e.g. AWS,Azure,GCP';
update single_option set option='Platform as a service (examples: Heroku, Force.com, Google App Engine)' where option='Platform as a service e.g. Heroku, Force.com, Google App Engine';
update single_option set option='Other. Specify in the comments field' where option='Other, please put in comments box below';
update question set question_text ='How mature is the containerization process, if any?' where question_text='How mature is the existing containerisation process, if any?';
update question set description ='If the team has used containers in the past, how was it done?' where description='If the team has used container previously how have they used them';
update single_option set option='Application runs in a container on a laptop or desktop' where option='Desktop-led container implementation designed to support running application on a laptop. Container treated like a VM with multiple services';
update single_option set deleted=true where option='Use of a init process within the container to manage multiple container processes that run independently but are tightly integrated';
update single_option set option='Some experience with containers but not yet fully defined' where option='Some experience with containers but not fully defined as yet';
update single_option set option='Proficient with containers and container platforms (examples: Swarm, Kubernetes)' where option='Proficient with containers and container platforms e.g. Swarm, K8S';
update single_option set option='Application containerization has not yet been attempted' where option='Application containerisation not attempted as yet';

-- non unique texts
update single_option set option='Does not require service discovery' where option='None required' and singleoption_order = 5;
update single_option set option='No cluster management required' where option='None required' and singleoption_order = 4;

update question set description='How does the application retrieve credentials, keys, or certificates? External systems are runtime dependencies.' where description like 'External systems are amber%';

-- adding new option
update single_option set singleoption_order = 7 where option = 'Other. Specify in the comments field';
insert into single_option
    (id, singleoption_order, option,risk,question_id)
values
    (nextval('hibernate_sequence'), 6, 'Hybrid cloud (public and private cloud providers)', 'GREEN', (select id from question where name = 'CURRHOST'));
