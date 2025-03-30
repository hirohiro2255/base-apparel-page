module Main exposing (..)

import Browser
import Html exposing (Html, a, br, button, div, form, h1, header, img, input, main_, p, section, small, strong, text)
import Html.Attributes exposing (class, classList, placeholder, src, type_)
import Html.Events exposing (onInput, onSubmit)
import Regex
import VitePluginHelper


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { email : String
    , emailError : Maybe String
    }


init : Model
init =
    { email = ""
    , emailError = Nothing
    }


type Msg
    = Email String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        Email email ->
            { model | email = email }

        Submit ->
            model


view : Model -> Html Msg
view model =
    main_ [ class "container" ]
        [ div [ class "container-wrapper" ]
            [ header [ class "header" ]
                [ div [ class "header-wrapper" ]
                    [ img [ class "header-img", src <| VitePluginHelper.asset "./assets/logo.svg" ] [] ]
                ]
            , section [ class "img-wrapper" ]
                [ img [ class "img", src <| VitePluginHelper.asset "./assets/hero-mobile.jpg" ] []
                ]
            , section [ class "form-container" ]
                [ div [ class "form-group" ]
                    [ h1 [ class "heading" ] [ text "WE'RE", br [] [] ]
                    , p [ class "paragraph" ] [ text "Hello fellow shoppers! We're currently building our new fashion store. Add your email below to stay up-to-date with announcements and our launch deals." ]
                    , form [ class "form" ]
                        [ div [ class "input-wrapper" ]
                            [ input
                                [ classList [ ( "input", True ), ( "error-input", True ) ]
                                , type_ "text"
                                , placeholder "janeappleseed#email.com"
                                ]
                                []
                            , button [ class "button" ]
                                [ img [ class "arrow", src <| VitePluginHelper.asset "./assets/icon-arrow.svg" ] []
                                ]
                            ]
                        , small [ class "error-msg" ] [ text "Please provide a valid email" ]
                        ]
                    ]
                ]
            ]
        ]
