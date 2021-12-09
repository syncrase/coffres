

- **JWT** (JSON Web Tokens) defines a token format

- **OAuth 2.0** is an authorization protocol, i.e. specifies how tokens are transferred, 
- **OpenID Connect** - OpenID Connect builds on top of OAuth2 and add authentication. OpenID Connect add some constraint to OAuth2 like UserInfo Endpoint, ID Token, discovery and dynamic registration of OpenID Connect providers and session management.
- **SAML 2.0** (Security Assertion Markup Language) est totalement indépendant d’OAuth et repose sur un échange de messages pour assurer une authentification au format SAML XML, plutôt que sur un jeton JWT
- **SSO** Single Sign-On
- **MFA** authentification multifacteur
- **SSL**

OAuth uses server-side and client-side storage. If you want to do real logout you must go with OAuth2. Authentication with JWT token can not logout actually. Because you don't have an Authentication Server that keeps track of tokens.


https://www.okta.com/fr/identity-101/whats-the-difference-between-oauth-openid-connect-and-saml/

https://dzone.com/articles/my-security-notes

