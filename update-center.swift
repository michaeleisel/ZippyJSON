struct update-center {    let `connectionCheckUrl`: String
    let `core`: core
    let `id`: String
    let `plugins`: plugins
    let `signature`: signature
    let `updateCenterVersion`: String
}

struct signature {    let `certificates`: [String]
    let `correct_digest`: String
    let `correct_signature`: String
    let `digest`: String
    let `signature`: String
}

struct plugins {    let `AdaptivePlugin`: AdaptivePlugin
    let `AnchorChain`: AnchorChain
    let `BlameSubversion`: BlameSubversion
    let `BlazeMeterJenkinsPlugin`: BlazeMeterJenkinsPlugin
    let `ColumnPack-plugin`: ColumnPack-plugin
    let `ColumnsPlugin`: ColumnsPlugin
    let `Exclusion`: Exclusion
    let `LavaLampNotifier`: LavaLampNotifier
    let `Matrix-sorter-plugin`: Matrix-sorter-plugin
    let `PrioritySorter`: PrioritySorter
    let `SCTMExecutor`: SCTMExecutor
    let `SSSCM`: SSSCM
    let `Schmant`: Schmant
    let `Surround-SCM-plugin`: Surround-SCM-plugin
    let `TwilioNotifier`: TwilioNotifier
    let `URLSCM`: URLSCM
    let `WebSVN2`: WebSVN2
    let `accurev`: accurev
    let `active-directory`: active-directory
    let `additional-identities-plugin`: additional-identities-plugin
    let `all-changes`: all-changes
    let `analysis-collector`: analysis-collector
    let `analysis-core`: analysis-core
    let `android-emulator`: android-emulator
    let `android-lint`: android-lint
    let `ansicolor`: ansicolor
    let `ant`: ant
    let `antexec`: antexec
    let `any-buildstep`: any-buildstep
    let `anything-goes-formatter`: anything-goes-formatter
    let `appaloosa-plugin`: appaloosa-plugin
    let `application-director-plugin`: application-director-plugin
    let `artifact-diff-plugin`: artifact-diff-plugin
    let `artifactdeployer`: artifactdeployer
    let `artifactory`: artifactory
    let `asakusa-satellite-plugin`: asakusa-satellite-plugin
    let `assembla`: assembla
    let `assembla-auth`: assembla-auth
    let `associated-files`: associated-files
    let `async-http-client`: async-http-client
    let `async-job`: async-job
    let `audit-trail`: audit-trail
    let `avatar`: avatar
    let `backlog`: backlog
    let `backup`: backup
    let `bamboo-notifier`: bamboo-notifier
    let `batch-task`: batch-task
    let `bazaar`: bazaar
    let `beer`: beer
    let `bitkeeper`: bitkeeper
    let `blame-upstream-commiters`: blame-upstream-commiters
    let `blink1`: blink1
    let `blitz_io-jenkins`: blitz_io-jenkins
    let `brakeman`: brakeman
    let `browser-axis-plugin`: browser-axis-plugin
    let `bruceschneier`: bruceschneier
    let `buckminster`: buckminster
    let `buddycloud`: buddycloud
    let `bugzilla`: bugzilla
    let `build-blocker-plugin`: build-blocker-plugin
    let `build-cause-run-condition`: build-cause-run-condition
    let `build-failure-analyzer`: build-failure-analyzer
    let `build-flow-plugin`: build-flow-plugin
    let `build-keeper-plugin`: build-keeper-plugin
    let `build-metrics`: build-metrics
    let `build-name-setter`: build-name-setter
    let `build-node-column`: build-node-column
    let `build-pipeline-plugin`: build-pipeline-plugin
    let `build-publisher`: build-publisher
    let `build-timeout`: build-timeout
    let `build-user-vars-plugin`: build-user-vars-plugin
    let `buildcoin-plugin`: buildcoin-plugin
    let `buildcontext-capture`: buildcontext-capture
    let `buildresult-trigger`: buildresult-trigger
    let `buildtriggerbadge`: buildtriggerbadge
    let `built-on-column`: built-on-column
    let `bulk-builder`: bulk-builder
    let `caliper-ci`: caliper-ci
    let `campfire`: campfire
    let `caroline`: caroline
    let `cas-plugin`: cas-plugin
    let `cas1`: cas1
    let `cccc`: cccc
    let `ccm`: ccm
    let `changelog-history`: changelog-history
    let `changes-since-last-success`: changes-since-last-success
    let `checkstyle`: checkstyle
    let `chosen`: chosen
    let `chrome-frame-plugin`: chrome-frame-plugin
    let `chromedriver`: chromedriver
    let `chucknorris`: chucknorris
    let `ci-game`: ci-game
    let `claim`: claim
    let `clamav`: clamav
    let `clang-scanbuild-plugin`: clang-scanbuild-plugin
    let `clearcase`: clearcase
    let `clearcase-release`: clearcase-release
    let `clearcase-ucm-baseline`: clearcase-ucm-baseline
    let `clearcase-ucm-plugin`: clearcase-ucm-plugin
    let `clone-workspace-scm`: clone-workspace-scm
    let `cloudbees-deployer-plugin`: cloudbees-deployer-plugin
    let `cloudbees-plugin-gateway`: cloudbees-plugin-gateway
    let `clover`: clover
    let `cloverphp`: cloverphp
    let `cmakebuilder`: cmakebuilder
    let `cmvc`: cmvc
    let `cobertura`: cobertura
    let `cocoapods-integration`: cocoapods-integration
    let `codecover`: codecover
    let `codescanner`: codescanner
    let `collabnet`: collabnet
    let `collapsing-console-sections`: collapsing-console-sections
    let `compact-columns`: compact-columns
    let `computer-queue-plugin`: computer-queue-plugin
    let `concordionpresenter`: concordionpresenter
    let `conditional-buildstep`: conditional-buildstep
    let `config-autorefresh-plugin`: config-autorefresh-plugin
    let `config-file-provider`: config-file-provider
    let `config-rotator`: config-rotator
    let `configurationslicing`: configurationslicing
    let `configure-job-column-plugin`: configure-job-column-plugin
    let `confluence-publisher`: confluence-publisher
    let `console-column-plugin`: console-column-plugin
    let `copy-data-to-workspace-plugin`: copy-data-to-workspace-plugin
    let `copy-project-link`: copy-project-link
    let `copy-to-slave`: copy-to-slave
    let `copyartifact`: copyartifact
    let `countjobs-viewstabbar`: countjobs-viewstabbar
    let `covcomplplot`: covcomplplot
    let `coverity`: coverity
    let `cppcheck`: cppcheck
    let `cppncss`: cppncss
    let `cpptest`: cpptest
    let `crap4j`: crap4j
    let `create-fingerprint`: create-fingerprint
    let `create-fingerprint-plugin`: create-fingerprint-plugin
    let `createjobadvanced`: createjobadvanced
    let `credentials`: credentials
    let `cron_column`: cron_column
    let `crowd`: crowd
    let `crowd2`: crowd2
    let `custom-job-icon`: custom-job-icon
    let `custom-tools-plugin`: custom-tools-plugin
    let `cvs`: cvs
    let `cvs-tag`: cvs-tag
    let `cygpath`: cygpath
    let `darcs`: darcs
    let `dashboard-view`: dashboard-view
    let `database`: database
    let `database-drizzle`: database-drizzle
    let `database-h2`: database-h2
    let `database-mysql`: database-mysql
    let `database-postgresql`: database-postgresql
    let `dbCharts`: dbCharts
    let `debian-package-builder`: debian-package-builder
    let `delete-log-plugin`: delete-log-plugin
    let `delta-cloud`: delta-cloud
    let `dependency-queue-plugin`: dependency-queue-plugin
    let `dependencyanalyzer`: dependencyanalyzer
    let `depgraph-view`: depgraph-view
    let `deploy`: deploy
    let `deploy-websphere`: deploy-websphere
    let `deployed-on-column`: deployed-on-column
    let `deploygate-plugin`: deploygate-plugin
    let `description-column-plugin`: description-column-plugin
    let `description-setter`: description-setter
    let `devstack`: devstack
    let `dimensionsscm`: dimensionsscm
    let `disk-usage`: disk-usage
    let `display-upstream-changes`: display-upstream-changes
    let `distTest`: distTest
    let `distfork`: distfork
    let `doclinks`: doclinks
    let `dos-trigger`: dos-trigger
    let `downstream-buildview`: downstream-buildview
    let `downstream-ext`: downstream-ext
    let `doxygen`: doxygen
    let `drmemory-plugin`: drmemory-plugin
    let `dropdown-viewstabbar-plugin`: dropdown-viewstabbar-plugin
    let `dry`: dry
    let `dry-run`: dry-run
    let `dtkit`: dtkit
    let `dumpinfo-buildwrapper-plugin`: dumpinfo-buildwrapper-plugin
    let `dynamic-axis`: dynamic-axis
    let `dynamicparameter`: dynamicparameter
    let `easyant`: easyant
    let `ec2`: ec2
    let `eclipse-update-site`: eclipse-update-site
    let `eggplant-plugin`: eggplant-plugin
    let `elOyente`: elOyente
    let `email-ext`: email-ext
    let `embeddable-build-status`: embeddable-build-status
    let `emma`: emma
    let `emmacoveragecolumn`: emmacoveragecolumn
    let `emotional-hudson`: emotional-hudson
    let `emotional-jenkins-plugin`: emotional-jenkins-plugin
    let `envfile`: envfile
    let `envinject`: envinject
    let `environment-script`: environment-script
    let `escaped-markup-plugin`: escaped-markup-plugin
    let `excludeMatrixParent`: excludeMatrixParent
    let `exclusive-execution`: exclusive-execution
    let `extended-choice-parameter`: extended-choice-parameter
    let `extended-read-permission`: extended-read-permission
    let `extensible-choice-parameter`: extensible-choice-parameter
    let `extension-filter`: extension-filter
    let `external-monitor-job`: external-monitor-job
    let `externalresource-dispatcher`: externalresource-dispatcher
    let `extra-columns`: extra-columns
    let `ezwall`: ezwall
    let `fail-the-build-plugin`: fail-the-build-plugin
    let `favorite`: favorite
    let `favorite-view`: favorite-view
    let `file-leak-detector`: file-leak-detector
    let `files-found-trigger`: files-found-trigger
    let `filesystem_scm`: filesystem_scm
    let `findbugs`: findbugs
    let `fitnesse`: fitnesse
    let `flashlog-plugin`: flashlog-plugin
    let `flexible-publish`: flexible-publish
    let `flexteam`: flexteam
    let `fogbugz`: fogbugz
    let `form-element-path`: form-element-path
    let `fortify360`: fortify360
    let `fstrigger`: fstrigger
    let `ftppublisher`: ftppublisher
    let `gallio`: gallio
    let `gant`: gant
    let `gatling`: gatling
    let `gcal`: gcal
    let `gcm-notification`: gcm-notification
    let `gerrit`: gerrit
    let `gerrit-trigger`: gerrit-trigger
    let `ghprb`: ghprb
    let `girls`: girls
    let `git`: git
    let `git-notes`: git-notes
    let `git-parameter`: git-parameter
    let `git-server`: git-server
    let `git-userContent`: git-userContent
    let `github`: github
    let `github-api`: github-api
    let `github-oauth`: github-oauth
    let `github-sqs-plugin`: github-sqs-plugin
    let `gitlab-hook`: gitlab-hook
    let `gitorious`: gitorious
    let `global-build-stats`: global-build-stats
    let `global-variable-string-parameter`: global-variable-string-parameter
    let `gnat`: gnat
    let `googleanalytics`: googleanalytics
    let `googlecode`: googlecode
    let `gradle`: gradle
    let `grails`: grails
    let `gravatar`: gravatar
    let `greenballs`: greenballs
    let `grinder`: grinder
    let `groovy`: groovy
    let `groovy-postbuild`: groovy-postbuild
    let `groovy-remote`: groovy-remote
    let `groovyaxis`: groovyaxis
    let `growl`: growl
    let `hadoop`: hadoop
    let `harvest`: harvest
    let `heavy-job`: heavy-job
    let `heroku-jenkins-plugin`: heroku-jenkins-plugin
    let `hgca`: hgca
    let `hipchat`: hipchat
    let `hipchat-plugin`: hipchat-plugin
    let `hockeyapp`: hockeyapp
    let `hp-application-automation-tools-plugin`: hp-application-automation-tools-plugin
    let `hsts-filter-plugin`: hsts-filter-plugin
    let `html-audio-notifier`: html-audio-notifier
    let `html5-notifier-plugin`: html5-notifier-plugin
    let `htmlpublisher`: htmlpublisher
    let `http_request`: http_request
    let `hudson-logaction-plugin`: hudson-logaction-plugin
    let `hudson-pview-plugin`: hudson-pview-plugin
    let `hudson-wsclean-plugin`: hudson-wsclean-plugin
    let `hudsontrayapp`: hudsontrayapp
    let `ikachan`: ikachan
    let `image-gallery`: image-gallery
    let `instant-messaging`: instant-messaging
    let `integrity-plugin`: integrity-plugin
    let `ion-deployer-plugin`: ion-deployer-plugin
    let `ios-device-connector`: ios-device-connector
    let `iphoneview`: iphoneview
    let `ipmessenger-plugin`: ipmessenger-plugin
    let `ircbot`: ircbot
    let `ivy`: ivy
    let `ivy-report`: ivy-report
    let `ivytrigger`: ivytrigger
    let `jabber`: jabber
    let `jacoco`: jacoco
    let `japex`: japex
    let `javadoc`: javadoc
    let `javancss`: javancss
    let `javanet`: javanet
    let `javanet-uploader`: javanet-uploader
    let `javatest-report`: javatest-report
    let `jboss`: jboss
    let `jcaptcha-plugin`: jcaptcha-plugin
    let `jclouds-jenkins`: jclouds-jenkins
    let `jdepend`: jdepend
    let `jenkins-cloudformation-plugin`: jenkins-cloudformation-plugin
    let `jenkins-flowdock-plugin`: jenkins-flowdock-plugin
    let `jenkins-jira-issue-updater`: jenkins-jira-issue-updater
    let `jenkins-leiningen`: jenkins-leiningen
    let `jenkins-multijob-plugin`: jenkins-multijob-plugin
    let `jenkins-tag-cloud-plugin`: jenkins-tag-cloud-plugin
    let `jenkins-testswarm-plugin`: jenkins-testswarm-plugin
    let `jenkinswalldisplay`: jenkinswalldisplay
    let `jenkinswalldisplay-pom`: jenkinswalldisplay-pom
    let `jenkow-plugin`: jenkow-plugin
    let `jigomerge`: jigomerge
    let `jira`: jira
    let `job-dsl`: job-dsl
    let `job-exporter`: job-exporter
    let `job-import-plugin`: job-import-plugin
    let `job-log-logger-plugin`: job-log-logger-plugin
    let `job-poll-action-plugin`: job-poll-action-plugin
    let `job-strongauth-simple`: job-strongauth-simple
    let `jobConfigHistory`: jobConfigHistory
    let `jobgenerator`: jobgenerator
    let `jobrevision`: jobrevision
    let `jobtype-column`: jobtype-column
    let `join`: join
    let `jprt`: jprt
    let `jquery`: jquery
    let `jquery-ui`: jquery-ui
    let `jsgames`: jsgames
    let `jslint`: jslint
    let `jsoup`: jsoup
    let `jsunit`: jsunit
    let `jswidgets`: jswidgets
    let `junit-attachments`: junit-attachments
    let `jython`: jython
    let `kagemai`: kagemai
    let `karotz`: karotz
    let `keepSlaveOffline`: keepSlaveOffline
    let `keyboard-shortcuts-plugin`: keyboard-shortcuts-plugin
    let `klaros-testmanagement`: klaros-testmanagement
    let `klocwork`: klocwork
    let `kundo`: kundo
    let `label-verifier`: label-verifier
    let `labeled-test-groups-publisher`: labeled-test-groups-publisher
    let `labmanager`: labmanager
    let `lastfailureversioncolumn`: lastfailureversioncolumn
    let `lastsuccessdescriptioncolumn`: lastsuccessdescriptioncolumn
    let `lastsuccessversioncolumn`: lastsuccessversioncolumn
    let `ldap`: ldap
    let `ldapemail`: ldapemail
    let `leiningen-plugin`: leiningen-plugin
    let `libvirt-slave`: libvirt-slave
    let `lingr-plugin`: lingr-plugin
    let `list-command`: list-command
    let `liverebel-deploy`: liverebel-deploy
    let `locale`: locale
    let `locked-files-report`: locked-files-report
    let `locks-and-latches`: locks-and-latches
    let `log-command`: log-command
    let `log-parser`: log-parser
    let `logaction-plugin`: logaction-plugin
    let `logfilesizechecker`: logfilesizechecker
    let `logging`: logging
    let `lotus-connections-plugin`: lotus-connections-plugin
    let `m2-extra-steps`: m2-extra-steps
    let `m2-repo-reaper`: m2-repo-reaper
    let `m2release`: m2release
    let `mail-watcher-plugin`: mail-watcher-plugin
    let `mailcommander`: mailcommander
    let `mailer`: mailer
    let `managed-scripts`: managed-scripts
    let `mantis`: mantis
    let `mask-passwords`: mask-passwords
    let `matrix-reloaded`: matrix-reloaded
    let `matrixtieparent`: matrixtieparent
    let `maven-dependency-update-trigger`: maven-dependency-update-trigger
    let `maven-deployment-linker`: maven-deployment-linker
    let `maven-info`: maven-info
    let `maven-invoker-plugin`: maven-invoker-plugin
    let `maven-metadata-plugin`: maven-metadata-plugin
    let `maven-plugin`: maven-plugin
    let `maven-repo-cleaner`: maven-repo-cleaner
    let `measurement-plots`: measurement-plots
    let `memegen`: memegen
    let `memory-map`: memory-map
    let `mercurial`: mercurial
    let `metadata`: metadata
    let `mock-security-realm`: mock-security-realm
    let `mongodb`: mongodb
    let `monitoring`: monitoring
    let `monkit-plugin`: monkit-plugin
    let `mozmill`: mozmill
    let `msbuild`: msbuild
    let `mstest`: mstest
    let `mstestrunner`: mstestrunner
    let `multi-module-tests-publisher`: multi-module-tests-publisher
    let `multi-slave-config-plugin`: multi-slave-config-plugin
    let `multiline-tabbar-plugin`: multiline-tabbar-plugin
    let `multiple-scms`: multiple-scms
    let `mysql-auth`: mysql-auth
    let `nabaztag`: nabaztag
    let `naginator`: naginator
    let `nant`: nant
    let `ncover`: ncover
    let `nerrvana-plugin`: nerrvana-plugin
    let `nested-view`: nested-view
    let `network-monitor`: network-monitor
    let `next-build-number`: next-build-number
    let `next-executions`: next-executions
    let `nexus-task-runner`: nexus-task-runner
    let `nodejs`: nodejs
    let `nodelabelparameter`: nodelabelparameter
    let `nodenamecolumn`: nodenamecolumn
    let `nodeofflinenotification`: nodeofflinenotification
    let `nopmdcheck`: nopmdcheck
    let `nopmdverifytrac`: nopmdverifytrac
    let `notification`: notification
    let `notifo`: notifo
    let `nsiqcollector`: nsiqcollector
    let `nunit`: nunit
    let `offlineonfailure-plugin`: offlineonfailure-plugin
    let `openJDK-native-plugin`: openJDK-native-plugin
    let `openid`: openid
    let `origo-issue-notifier`: origo-issue-notifier
    let `oslc-cm`: oslc-cm
    let `pam-auth`: pam-auth
    let `parameterized-trigger`: parameterized-trigger
    let `patch-parameter`: patch-parameter
    let `pathignore`: pathignore
    let `pegdown-formatter`: pegdown-formatter
    let `people-redirector`: people-redirector
    let `perforce`: perforce
    let `performance`: performance
    let `perfpublisher`: perfpublisher
    let `periodic-reincarnation`: periodic-reincarnation
    let `periodicbackup`: periodicbackup
    let `persona`: persona
    let `phing`: phing
    let `php`: php
    let `piwikanalytics`: piwikanalytics
    let `plasticscm-plugin`: plasticscm-plugin
    let `platformlabeler`: platformlabeler
    let `play-autotest-plugin`: play-autotest-plugin
    let `plot`: plot
    let `pmd`: pmd
    let `polarion`: polarion
    let `pollscm`: pollscm
    let `port-allocator`: port-allocator
    let `postbuild-task`: postbuild-task
    let `postbuildscript`: postbuildscript
    let `powershell`: powershell
    let `preSCMbuildstep`: preSCMbuildstep
    let `prereq-buildstep`: prereq-buildstep
    let `progress-bar-column-plugin`: progress-bar-column-plugin
    let `project-description-setter`: project-description-setter
    let `project-health-report`: project-health-report
    let `project-stats-plugin`: project-stats-plugin
    let `promoted-builds`: promoted-builds
    let `promoted-builds-simple`: promoted-builds-simple
    let `prqa-plugin`: prqa-plugin
    let `pry`: pry
    let `publish-over-cifs`: publish-over-cifs
    let `publish-over-ftp`: publish-over-ftp
    let `publish-over-ssh`: publish-over-ssh
    let `purge-build-queue-plugin`: purge-build-queue-plugin
    let `pvcs_scm`: pvcs_scm
    let `pwauth`: pwauth
    let `pxe`: pxe
    let `python`: python
    let `qc`: qc
    let `r`: r
    let `rad-builder`: rad-builder
    let `radiatorviewplugin`: radiatorviewplugin
    let `rake`: rake
    let `random-string-parameter`: random-string-parameter
    let `rbenv`: rbenv
    let `read-only-configurations`: read-only-configurations
    let `rebuild`: rebuild
    let `recipe`: recipe
    let `redmine`: redmine
    let `refit`: refit
    let `regexemail`: regexemail
    let `regression-report-plugin`: regression-report-plugin
    let `release`: release
    let `remote-terminal-access`: remote-terminal-access
    let `repo`: repo
    let `repository`: repository
    let `repository-connector`: repository-connector
    let `reverse-proxy-auth-plugin`: reverse-proxy-auth-plugin
    let `reviewboard`: reviewboard
    let `robot`: robot
    let `role-strategy`: role-strategy
    let `rrod`: rrod
    let `rtc`: rtc
    let `ruby`: ruby
    let `ruby-runtime`: ruby-runtime
    let `rubyMetrics`: rubyMetrics
    let `run-condition`: run-condition
    let `rundeck`: rundeck
    let `rvm`: rvm
    let `s3`: s3
    let `saferestart`: saferestart
    let `sauce-ondemand`: sauce-ondemand
    let `sbt`: sbt
    let `schedule-failed-builds`: schedule-failed-builds
    let `scm-sync-configuration`: scm-sync-configuration
    let `scm2job`: scm2job
    let `scons`: scons
    let `scp`: scp
    let `screenshot`: screenshot
    let `script-realm`: script-realm
    let `script-scm`: script-scm
    let `scripted-cloud-plugin`: scripted-cloud-plugin
    let `scriptler`: scriptler
    let `scripttrigger`: scripttrigger
    let `search-all-results-plugin`: search-all-results-plugin
    let `secret`: secret
    let `sectioned-view`: sectioned-view
    let `selection-tasks-plugin`: selection-tasks-plugin
    let `selenium`: selenium
    let `selenium-aes`: selenium-aes
    let `seleniumhq`: seleniumhq
    let `seleniumhtmlreport`: seleniumhtmlreport
    let `seleniumrc-plugin`: seleniumrc-plugin
    let `serenity`: serenity
    let `sfee`: sfee
    let `shared-objects`: shared-objects
    let `shelve-project-plugin`: shelve-project-plugin
    let `shiningpanda`: shiningpanda
    let `show-build-parameters`: show-build-parameters
    let `sicci_for_xcode`: sicci_for_xcode
    let `sidebar-link`: sidebar-link
    let `signal-killer`: signal-killer
    let `simple-parameterized-builds-report`: simple-parameterized-builds-report
    let `simple-theme-plugin`: simple-theme-plugin
    let `simpleclearcase`: simpleclearcase
    let `simpleupdatesite`: simpleupdatesite
    let `sitemonitor`: sitemonitor
    let `skip-certificate-check`: skip-certificate-check
    let `skype-notifier`: skype-notifier
    let `sladiator-notifier`: sladiator-notifier
    let `slave-prerequisites`: slave-prerequisites
    let `slave-setup`: slave-setup
    let `slave-squatter`: slave-squatter
    let `slave-status`: slave-status
    let `sloccount`: sloccount
    let `smart-jenkins`: smart-jenkins
    let `snsnotify`: snsnotify
    let `sonar`: sonar
    let `sonatype-ci`: sonatype-ci
    let `sounds`: sounds
    let `speaks`: speaks
    let `ssh`: ssh
    let `ssh-agent`: ssh-agent
    let `ssh-credentials`: ssh-credentials
    let `ssh-slaves`: ssh-slaves
    let `stackhammer`: stackhammer
    let `staf`: staf
    let `starteam`: starteam
    let `started-by-envvar`: started-by-envvar
    let `startup-trigger-plugin`: startup-trigger-plugin
    let `status-view`: status-view
    let `statusmonitor`: statusmonitor
    let `storable-configs-plugin`: storable-configs-plugin
    let `strawboss`: strawboss
    let `subversion`: subversion
    let `suite-test-groups-publisher`: suite-test-groups-publisher
    let `summary_report`: summary_report
    let `svn-release-mgr`: svn-release-mgr
    let `svn-revert-plugin`: svn-revert-plugin
    let `svn-tag`: svn-tag
    let `svn-workspace-cleaner`: svn-workspace-cleaner
    let `svncompat13`: svncompat13
    let `svncompat14`: svncompat14
    let `svnmerge`: svnmerge
    let `svnpublisher`: svnpublisher
    let `swarm`: swarm
    let `synergy`: synergy
    let `systemloadaverage-monitor`: systemloadaverage-monitor
    let `tap`: tap
    let `tasks`: tasks
    let `tattletale-plugin`: tattletale-plugin
    let `template-project`: template-project
    let `template-workflows`: template-workflows
    let `tepco`: tepco
    let `tepco-epuw`: tepco-epuw
    let `terminal`: terminal
    let `terminate-ssh-processes-plugin`: terminate-ssh-processes-plugin
    let `testabilityexplorer`: testabilityexplorer
    let `testflight`: testflight
    let `testingbot`: testingbot
    let `testlink`: testlink
    let `testng-plugin`: testng-plugin
    let `testopia`: testopia
    let `text-finder`: text-finder
    let `text-finder-run-condition`: text-finder-run-condition
    let `tfs`: tfs
    let `thinBackup`: thinBackup
    let `thread-dump-action-plugin`: thread-dump-action-plugin
    let `throttle-concurrents`: throttle-concurrents
    let `thucydides`: thucydides
    let `timestamper`: timestamper
    let `tmpcleaner`: tmpcleaner
    let `token-macro`: token-macro
    let `toolenv`: toolenv
    let `trac`: trac
    let `trac-publisher-plugin`: trac-publisher-plugin
    let `tracking-svn`: tracking-svn
    let `translation`: translation
    let `tuxdroid`: tuxdroid
    let `twitter`: twitter
    let `ui-samples-plugin`: ui-samples-plugin
    let `unicorn`: unicorn
    let `unity-asset-server`: unity-asset-server
    let `unity3d-plugin`: unity3d-plugin
    let `unreliable-slave-plugin`: unreliable-slave-plugin
    let `urltrigger`: urltrigger
    let `utplsql`: utplsql
    let `vagrant`: vagrant
    let `valgrind`: valgrind
    let `validating-string-parameter`: validating-string-parameter
    let `vboxwrapper`: vboxwrapper
    let `versioncolumn`: versioncolumn
    let `versionnumber`: versionnumber
    let `vertx`: vertx
    let `view-job-filters`: view-job-filters
    let `viewVC`: viewVC
    let `violations`: violations
    let `virtualbox`: virtualbox
    let `vmware`: vmware
    let `vsphere-cloud`: vsphere-cloud
    let `vss`: vss
    let `warnings`: warnings
    let `was-builder`: was-builder
    let `weblogic-deployer-plugin`: weblogic-deployer-plugin
    let `websocket`: websocket
    let `webtestpresenter`: webtestpresenter
    let `whitesource`: whitesource
    let `windmill`: windmill
    let `ws-cleanup`: ws-cleanup
    let `xcode-plugin`: xcode-plugin
    let `xfpanel`: xfpanel
    let `xframe-filter-plugin`: xframe-filter-plugin
    let `xpath-config-viewer`: xpath-config-viewer
    let `xpdev`: xpdev
    let `xshell`: xshell
    let `xtrigger`: xtrigger
    let `xunit`: xunit
    let `xvfb`: xvfb
    let `xvnc`: xvnc
    let `yammer`: yammer
    let `zentimestamp`: zentimestamp
    let `zubhium`: zubhium
}

struct zubhium {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct zentimestamp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct yammer {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct xvnc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xvfb {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xunit {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xtrigger {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct xshell {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xpdev {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct xpath-config-viewer {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xframe-filter-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct xfpanel {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct xcode-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ws-cleanup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct windmill {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct whitesource {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct webtestpresenter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct websocket {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct weblogic-deployer-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct was-builder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct warnings {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct vss {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct vsphere-cloud {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct vmware {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct virtualbox {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct violations {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct viewVC {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct view-job-filters {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct vertx {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct versionnumber {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct versioncolumn {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct vboxwrapper {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct validating-string-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct valgrind {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct vagrant {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct utplsql {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct urltrigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct unreliable-slave-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct unity3d-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct unity-asset-server {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct unicorn {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ui-samples-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct twitter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct tuxdroid {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct translation {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct tracking-svn {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct trac-publisher-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct trac {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct toolenv {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct token-macro {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct tmpcleaner {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct timestamper {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct thucydides {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct throttle-concurrents {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct thread-dump-action-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct thinBackup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct tfs {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct text-finder-run-condition {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct text-finder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct testopia {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct testng-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct testlink {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct testingbot {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct testflight {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct testabilityexplorer {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct terminate-ssh-processes-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct terminal {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct tepco-epuw {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct tepco {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct template-workflows {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct template-project {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct tattletale-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct tasks {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct tap {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct systemloadaverage-monitor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct synergy {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct swarm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct svnpublisher {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svnmerge {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svncompat14 {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svncompat13 {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svn-workspace-cleaner {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svn-tag {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svn-revert-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct svn-release-mgr {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct summary_report {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct suite-test-groups-publisher {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct subversion {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct strawboss {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct storable-configs-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct statusmonitor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct status-view {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct startup-trigger-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct started-by-envvar {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct starteam {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct staf {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct stackhammer {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ssh-slaves {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct ssh-credentials {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ssh-agent {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ssh {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct speaks {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sounds {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sonatype-ci {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct sonar {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct snsnotify {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct smart-jenkins {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sloccount {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct slave-status {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct slave-squatter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct slave-setup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct slave-prerequisites {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sladiator-notifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct skype-notifier {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct skip-certificate-check {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct sitemonitor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct simpleupdatesite {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct simpleclearcase {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct simple-theme-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct simple-parameterized-builds-report {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct signal-killer {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct sidebar-link {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct sicci_for_xcode {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct show-build-parameters {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct shiningpanda {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct shelve-project-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct shared-objects {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct sfee {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct serenity {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct seleniumrc-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct seleniumhtmlreport {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct seleniumhq {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct selenium-aes {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct selenium {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct selection-tasks-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sectioned-view {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct secret {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct search-all-results-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct scripttrigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct scriptler {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct scripted-cloud-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct script-scm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct script-realm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct screenshot {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct scp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct scons {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct scm2job {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct scm-sync-configuration {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct schedule-failed-builds {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct sbt {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct sauce-ondemand {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct saferestart {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct s3 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct rvm {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct rundeck {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct run-condition {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct rubyMetrics {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ruby-runtime {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct ruby {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct rtc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct rrod {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct role-strategy {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct robot {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct reviewboard {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct reverse-proxy-auth-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct repository-connector {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct repository {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct repo {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct remote-terminal-access {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct release {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct regression-report-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct regexemail {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct refit {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct redmine {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct recipe {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct rebuild {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct read-only-configurations {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct rbenv {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct random-string-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct rake {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct radiatorviewplugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct rad-builder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct r {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct qc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct python {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct pxe {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct pwauth {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct pvcs_scm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct purge-build-queue-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct publish-over-ssh {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct publish-over-ftp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct publish-over-cifs {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct pry {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct prqa-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct promoted-builds-simple {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct promoted-builds {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct project-stats-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct project-health-report {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct project-description-setter {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct progress-bar-column-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct prereq-buildstep {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct preSCMbuildstep {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct powershell {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct postbuildscript {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct postbuild-task {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct port-allocator {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct pollscm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct polarion {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct pmd {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct plot {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct play-autotest-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct platformlabeler {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct plasticscm-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct piwikanalytics {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct php {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct phing {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct persona {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct periodicbackup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `email`: String
    let `name`: String
}

struct periodic-reincarnation {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct perfpublisher {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct performance {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct perforce {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct people-redirector {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct pegdown-formatter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct pathignore {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct patch-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct parameterized-trigger {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct pam-auth {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct oslc-cm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct origo-issue-notifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct openid {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct openJDK-native-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct offlineonfailure-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `email`: String
    let `name`: String
}

struct nunit {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct nsiqcollector {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct notifo {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct notification {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct nopmdverifytrac {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct nopmdcheck {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct nodeofflinenotification {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct nodenamecolumn {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct nodelabelparameter {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct nodejs {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct nexus-task-runner {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct next-executions {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct next-build-number {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct network-monitor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct nested-view {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct nerrvana-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ncover {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct nant {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct naginator {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct nabaztag {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct mysql-auth {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct multiple-scms {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct multiline-tabbar-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct multi-slave-config-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct multi-module-tests-publisher {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mstestrunner {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mstest {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct msbuild {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mozmill {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct monkit-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct monitoring {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mongodb {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct mock-security-realm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct metadata {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct mercurial {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct memory-map {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct memegen {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct measurement-plots {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct maven-repo-cleaner {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct maven-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct maven-metadata-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct maven-invoker-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct maven-info {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct maven-deployment-linker {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct maven-dependency-update-trigger {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct matrixtieparent {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct matrix-reloaded {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct mask-passwords {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mantis {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct managed-scripts {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct mailer {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mailcommander {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct mail-watcher-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct m2release {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct m2-repo-reaper {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct m2-extra-steps {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct lotus-connections-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct logging {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct logfilesizechecker {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct logaction-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct log-parser {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct log-command {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct locks-and-latches {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct locked-files-report {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct locale {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct liverebel-deploy {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct list-command {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct lingr-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct libvirt-slave {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct leiningen-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ldapemail {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct ldap {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct lastsuccessversioncolumn {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct lastsuccessdescriptioncolumn {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct lastfailureversioncolumn {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct labmanager {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct labeled-test-groups-publisher {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct label-verifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct kundo {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct klocwork {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct klaros-testmanagement {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct keyboard-shortcuts-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct keepSlaveOffline {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct karotz {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct kagemai {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct jython {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct junit-attachments {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jswidgets {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jsunit {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jsoup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jslint {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jsgames {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jquery-ui {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jquery {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jprt {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct join {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jobtype-column {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jobrevision {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jobgenerator {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jobConfigHistory {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct job-strongauth-simple {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct job-poll-action-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct job-log-logger-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct job-import-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct job-exporter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct job-dsl {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: []
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct jira {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jigomerge {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jenkow-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jenkinswalldisplay-pom {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkinswalldisplay {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jenkins-testswarm-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jenkins-tag-cloud-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkins-multijob-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkins-leiningen {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkins-jira-issue-updater {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkins-flowdock-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jenkins-cloudformation-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jdepend {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jclouds-jenkins {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jcaptcha-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct jboss {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct javatest-report {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct javanet-uploader {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct javanet {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct javancss {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct javadoc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct japex {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct jacoco {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct jabber {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ivytrigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ivy-report {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ivy {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ircbot {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ipmessenger-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct iphoneview {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ios-device-connector {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct ion-deployer-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct integrity-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct instant-messaging {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct image-gallery {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ikachan {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct hudsontrayapp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct hudson-wsclean-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct hudson-pview-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct hudson-logaction-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct http_request {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct htmlpublisher {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct html5-notifier-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct html-audio-notifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct hsts-filter-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct hp-application-automation-tools-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct hockeyapp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct hipchat-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct hipchat {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct hgca {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct heroku-jenkins-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct heavy-job {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct harvest {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct hadoop {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct growl {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct groovyaxis {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct groovy-remote {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: []
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct groovy-postbuild {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct groovy {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct grinder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct greenballs {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct gravatar {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct grails {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct gradle {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct googlecode {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct googleanalytics {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct gnat {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct global-variable-string-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct global-build-stats {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct gitorious {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct gitlab-hook {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct github-sqs-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct github-oauth {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct github-api {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct github {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct git-userContent {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct git-server {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct git-parameter {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct git-notes {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct git {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct girls {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct ghprb {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct gerrit-trigger {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct gerrit {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct gcm-notification {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct gcal {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `name`: String
}

struct gatling {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct gant {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct gallio {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ftppublisher {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct fstrigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct fortify360 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct form-element-path {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct fogbugz {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct flexteam {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct flexible-publish {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct flashlog-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct fitnesse {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct findbugs {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct filesystem_scm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct files-found-trigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct file-leak-detector {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct favorite-view {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct favorite {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct fail-the-build-plugin {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ezwall {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct extra-columns {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct externalresource-dispatcher {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct external-monitor-job {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct extension-filter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct extensible-choice-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct extended-read-permission {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct extended-choice-parameter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct exclusive-execution {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct excludeMatrixParent {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct escaped-markup-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct environment-script {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct envinject {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct envfile {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct emotional-jenkins-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct emotional-hudson {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct emmacoveragecolumn {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct emma {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct embeddable-build-status {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct email-ext {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct elOyente {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct eggplant-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct eclipse-update-site {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct ec2 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct easyant {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dynamicparameter {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dynamic-axis {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dumpinfo-buildwrapper-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dtkit {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dry-run {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dry {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dropdown-viewstabbar-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct drmemory-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct doxygen {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct downstream-ext {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct downstream-buildview {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dos-trigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct doclinks {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct distfork {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct distTest {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct display-upstream-changes {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct disk-usage {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dimensionsscm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct devstack {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct description-setter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct description-column-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct deploygate-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct deployed-on-column {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct deploy-websphere {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct deploy {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct depgraph-view {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dependencyanalyzer {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dependency-queue-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct delta-cloud {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct delete-log-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct debian-package-builder {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct dbCharts {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct database-postgresql {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct database-mysql {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct database-h2 {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct database-drizzle {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct database {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dashboard-view {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct darcs {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct cygpath {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct cvs-tag {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cvs {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct custom-tools-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct custom-job-icon {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct crowd2 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct crowd {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct cron_column {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct credentials {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct createjobadvanced {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct create-fingerprint-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct create-fingerprint {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct crap4j {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct cpptest {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cppncss {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cppcheck {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct coverity {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct covcomplplot {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct countjobs-viewstabbar {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct copyartifact {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct copy-to-slave {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct copy-project-link {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct copy-data-to-workspace-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct console-column-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct confluence-publisher {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct configure-job-column-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct configurationslicing {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct config-rotator {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct config-file-provider {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct config-autorefresh-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct conditional-buildstep {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct concordionpresenter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct computer-queue-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct compact-columns {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct collapsing-console-sections {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct collabnet {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct codescanner {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct codecover {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cocoapods-integration {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct cobertura {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cmvc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct cmakebuilder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct cloverphp {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct clover {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct cloudbees-plugin-gateway {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cloudbees-deployer-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct clone-workspace-scm {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct clearcase-ucm-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct clearcase-ucm-baseline {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct clearcase-release {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct clearcase {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct clang-scanbuild-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct clamav {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct claim {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct ci-game {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct chucknorris {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct chromedriver {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct chrome-frame-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct chosen {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct checkstyle {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct changes-since-last-success {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct changelog-history {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ccm {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct cccc {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct cas1 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct cas-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct caroline {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct campfire {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct caliper-ci {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct bulk-builder {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct built-on-column {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct buildtriggerbadge {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct buildresult-trigger {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct buildcontext-capture {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct buildcoin-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct build-user-vars-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct build-timeout {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct build-publisher {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-pipeline-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-node-column {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct build-name-setter {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-metrics {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-keeper-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-flow-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct build-failure-analyzer {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-cause-run-condition {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct build-blocker-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct bugzilla {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `name`: String
}

struct buddycloud {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct buckminster {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct bruceschneier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct browser-axis-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct brakeman {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct blitz_io-jenkins {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct blink1 {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct blame-upstream-commiters {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct bitkeeper {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct beer {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct bazaar {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct batch-task {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct bamboo-notifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct backup {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct backlog {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct avatar {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct audit-trail {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct async-job {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct async-http-client {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct associated-files {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: []
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct assembla-auth {    let `buildDate`: String
    let `compatibleSinceVersion`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct assembla {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct asakusa-satellite-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct artifactory {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct artifactdeployer {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct artifact-diff-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct application-director-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct appaloosa-plugin {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct anything-goes-formatter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct any-buildstep {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct antexec {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct ant {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct ansicolor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct android-lint {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct android-emulator {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct analysis-core {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct analysis-collector {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct all-changes {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct additional-identities-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct active-directory {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct accurev {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct WebSVN2 {    let `buildDate`: String
    let `dependencies`: [dependencies]
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `name`: String
}

struct dependencies {    let `name`: String
    let `optional`: Bool
    let `version`: String
}

struct URLSCM {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct TwilioNotifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct Surround-SCM-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `email`: String
    let `name`: String
}

struct Schmant {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
}

struct SSSCM {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
}

struct SCTMExecutor {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct PrioritySorter {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct Matrix-sorter-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: []
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct LavaLampNotifier {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct Exclusion {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ColumnsPlugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct ColumnPack-plugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct BlazeMeterJenkinsPlugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `name`: String
}

struct BlameSubversion {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `previousTimestamp`: String
    let `previousVersion`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct AnchorChain {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct AdaptivePlugin {    let `buildDate`: String
    let `dependencies`: []
    let `developers`: [developers]
    let `excerpt`: String
    let `gav`: String
    let `labels`: [String]
    let `name`: String
    let `releaseTimestamp`: String
    let `requiredCore`: String
    let `scm`: String
    let `sha1`: String
    let `title`: String
    let `url`: String
    let `version`: String
    let `wiki`: String
}

struct developers {    let `developerId`: String
    let `email`: String
    let `name`: String
}

struct core {    let `buildDate`: String
    let `name`: String
    let `sha1`: String
    let `url`: String
    let `version`: String
}

