module I18n exposing (..)

--where

import Context exposing (..)
import String


type alias Model =
    { slogan : List String
    , beta :
        { join : String
        , email : String
        }
    , keywords :
        { master : String
        , masterVersion : String
        , masterArchive : String
        , labo : String
        , laboQc : String
        , laboDelivery : String
        , diffusion : String
        , diffusion2 : String
        , diffusionCert : String
        , diffusionOnDemand : String
        }
    , contact :
        { twitter : String
        , email : String
        , job : String
        }
    }



-- Translations --


init ctx =
    { slogan = slogan ctx
    , beta =
        { join = betaJoin ctx
        , email = betaEmail ctx
        }
    , keywords =
        { master = keywordsMaster ctx
        , masterVersion = keywordsMasterVersion ctx
        , masterArchive = keywordsMasterArchive ctx
        , labo = keywordsLabo ctx
        , laboQc = keywordsLaboQc ctx
        , laboDelivery = keywordsLaboDelivery ctx
        , diffusion = keywordsDiffusion ctx
        , diffusion2 = keywordsDiffusion2 ctx
        , diffusionCert = keywordsDiffusionCert ctx
        , diffusionOnDemand = keywordsDiffusionOnDemand ctx
        }
    , contact =
        { twitter = contactTwitter ctx
        , email = contactEmail ctx
        , job = contactJob ctx
        }
    }


slogan =
    translate
        { en =
            [ "The new lab services "
            , "for producers, distributors, broadcasters "
            , "and publishers of audiovisual works "
            ]
        , fr =
            [ "Les nouveaux services labo "
            , "pour producteurs, distributeurs "
            , "et diffuseurs audiovisuels "
            ]
        }


keywordsMaster =
    translate
        { fr = "Masters"
        , en = "Masters"
        }


keywordsMasterVersion =
    translate
        { fr = "Gestion de version"
        , en = "Version management"
        }


keywordsMasterArchive =
    translate
        { fr = "Archivage"
        , en = "Archiving"
        }


keywordsLabo =
    translate
        { fr = "Labo en Ligne"
        , en = "Online Lab"
        }


keywordsLaboQc =
    translate
        { fr = "Contrôle qualité"
        , en = "Quality check"
        }


keywordsLaboDelivery =
    translate
        { fr = "Livrables domestiques & internationaux"
        , en = "Domestic & international delivery"
        }


keywordsDiffusion =
    translate
        { fr = "Diffusion"
        , en = "Diffusion"
        }


keywordsDiffusion2 =
    translate
        { fr = "& Monétisation"
        , en = "& Monetization"
        }


keywordsDiffusionCert =
    translate
        { fr = "Diffusion & Livrables certifiés"
        , en = "Certified broadcast & delivery"
        }


keywordsDiffusionOnDemand =
    translate
        { fr = "Diffusion & Livrables à la demande"
        , en = "On demand broadcast & delivery"
        }


betaJoin =
    translate
        { fr = "Rejoindre la beta"
        , en = "Join the beta"
        }


betaEmail =
    translate
        { fr = "Votre email"
        , en = "Your email"
        }


contactTwitter =
    translate
        { fr = "Recevoir des infos"
        , en = "Get updates"
        }


contactEmail =
    translate
        { fr = "Poser des questions"
        , en = "Ask questions"
        }


contactJob =
    translate
        { en = "Write the answers"
        , fr = "Ecrire les réponses"
        }
