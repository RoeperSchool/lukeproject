module.exports = angular.module 'wordpress-hybrid-client.init'
    .service '$WPHCInit', ($q, $WPHCConfig, $log, $WPHCCacheImg) ->
        init: ->
            hockeyapp.start(null, null, "4111ba92c09f426b93eaa278e47592c0")
            promises = []
            promises.push $WPHCCacheImg.init()
            $q.all promises
            .then ->
                $log.info 'Init: success!'
