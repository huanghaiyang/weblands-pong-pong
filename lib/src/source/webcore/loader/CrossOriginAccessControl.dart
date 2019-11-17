import 'package:weblands_pong_pong/src/source/webcore/dom/Document.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/ResourceLoaderOptions.dart';
import 'package:weblands_pong_pong/src/source/webcore/loader/cache/CachedResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/page/SecurityOrigin.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/ReferrerPolicy.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/HTTPHeaderMap.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceError.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceRequest.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/ResourceResponse.dart';
import 'package:weblands_pong_pong/src/source/webcore/platform/network/StoredCredentialsPolicy.dart';
import 'package:weblands_pong_pong/src/source/wtf/wtf/URL.dart';

bool isSimpleCrossOriginAccessRequest(String method, HTTPHeaderMap headerMap) {}

bool isOnAccessControlSimpleRequestMethodWhitelist(String method) {}

void updateRequestReferrer(ResourceRequest request, ReferrerPolicy policy, String referrer) {}

void updateRequestForAccessControl(ResourceRequest request, SecurityOrigin origin, StoredCredentialsPolicy policy) {}

ResourceRequest createAccessControlPreflightRequest(ResourceRequest request, SecurityOrigin origin, String url) {}

CachedResourceRequest createPotentialAccessControlRequest(
    ResourceRequest request, Document document, String crossOriginAttribute, ResourceLoaderOptions options) {}

bool isValidCrossOriginRedirectURL(URL url) {}

bool passesAccessControlCheck(ResourceResponse response, StoredCredentialsPolicy policy, SecurityOrigin origin, String errorDescription) {}

bool validatePreflightResponse(
    ResourceRequest request, ResourceResponse response, StoredCredentialsPolicy policy, SecurityOrigin origin, String errorDescription) {}

ResourceError validateCrossOriginResourcePolicy(SecurityOrigin origin, URL url, ResourceResponse response) {}
