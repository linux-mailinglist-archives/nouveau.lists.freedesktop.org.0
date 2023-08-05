Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD9F770F3E
	for <lists+nouveau@lfdr.de>; Sat,  5 Aug 2023 12:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2195C10E17A;
	Sat,  5 Aug 2023 10:18:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930CD10E17A
 for <nouveau@lists.freedesktop.org>; Sat,  5 Aug 2023 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691230703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EDl8FKi4TmGBJc8DUiagN0W08gSz4Sjm38M3DkmH1A8=;
 b=X7Z4WG7c4FIfEwYOUT/Gm3eEvaWV5ZmA0uggvulgMQ+ctgmA2LRJh8XxZ3cXL4p8mwswPx
 Xv3E9AdWvhFJhcWYhnGxoJEregMKfZcDz8b5AMb1GNU69n4E65VgQ0axLwOs9P+iLjgpeI
 fC6HghxNHFV4gnciO9zdolUGnM5BUXo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-MQYGu1owO_KL0tLDyB5vHw-1; Sat, 05 Aug 2023 06:18:18 -0400
X-MC-Unique: MQYGu1owO_KL0tLDyB5vHw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-63d289847dcso7641936d6.0
 for <nouveau@lists.freedesktop.org>; Sat, 05 Aug 2023 03:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691230698; x=1691835498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EDl8FKi4TmGBJc8DUiagN0W08gSz4Sjm38M3DkmH1A8=;
 b=BC6Z/3TOE5WRlfDGJr6us7JQpMVVQu6VZ53XoE67uwzrEP0yR2Xsk/EeGl4ANRRD2+
 j79zGpeZpbEArr+PYwO0YZEwA+L8bmhLAyjruF/cauMWUO2FJcdN7y25GD5QjLyZpQZS
 SgpNuDNmNXh+2nnIbEPvjlUbGqf5rsHxKhgnt0Eh2TALX1FheEYRA3W50p7f9cZ7qFO3
 2AF26wZoP+laBAG6oOTDHJ8RGyJCszj5qhu+6uKPjgk6qUiKz0zCcPkp9Jl4N5weTBAf
 +AfPP3Mzl7h+uSmv5qlknPgEYAR7etHRtOADKGJz0X7lJ3AoD+Ub5mcflRXF3MFiKhMz
 cOkg==
X-Gm-Message-State: ABy/qLb4uP/NOM202YDAyTMxpDcSsrJlLH+kwUt4Kj3k+YNrCPEe1bjX
 kavcZhfb9WDQ7PUoRJRnLrLtU/xYAkcuaDkQ/biw6oiqCAhwzGG3Izwh1E4u0b61D7JIYnppFC9
 Wzo0JpjFwDzfeR/sZkkGg/xo58788rdoC0A==
X-Received: by 2002:ac8:5c05:0:b0:40f:a5bb:5276 with SMTP id
 i5-20020ac85c05000000b0040fa5bb5276mr21244859qti.1.1691230697925; 
 Sat, 05 Aug 2023 03:18:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxbKkXSoa09vwMpsK5fJJErUueAZzn6Eyh8re2STw/wxSsOI0uRnQzLEtQYQPJQ+wGIPPrkA==
X-Received: by 2002:ac8:5c05:0:b0:40f:a5bb:5276 with SMTP id
 i5-20020ac85c05000000b0040fa5bb5276mr21244843qti.1.1691230697692; 
 Sat, 05 Aug 2023 03:18:17 -0700 (PDT)
Received: from kherbst.pingu.com ([31.17.16.107])
 by smtp.gmail.com with ESMTPSA id
 dq15-20020a05622a520f00b0040c72cae9f9sm1247325qtb.93.2023.08.05.03.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Aug 2023 03:18:16 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  5 Aug 2023 12:18:13 +0200
Message-ID: <20230805101813.2603989-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/disp: Revert a NULL check inside
 nouveau_connector_get_modes
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Olaf Skibbe <news@kravcenko.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The original commit adding that check tried to protect the kenrel against
a potential invalid NULL pointer access.

However we call nouveau_connector_detect_depth once without a native_mode
set on purpose for non LVDS connectors and this broke DP support in a few
cases.

Cc: Olaf Skibbe <news@kravcenko.com>
Cc: Lyude Paul <lyude@redhat.com>
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/238
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/245
Fixes: 20a2ce87fbaf8 ("drm/nouveau/dp: check for NULL nv_connector->native_mode")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index f75c6f09dd2af..a2e0033e8a260 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -967,7 +967,7 @@ nouveau_connector_get_modes(struct drm_connector *connector)
 	/* Determine display colour depth for everything except LVDS now,
 	 * DP requires this before mode_valid() is called.
 	 */
-	if (connector->connector_type != DRM_MODE_CONNECTOR_LVDS && nv_connector->native_mode)
+	if (connector->connector_type != DRM_MODE_CONNECTOR_LVDS)
 		nouveau_connector_detect_depth(connector);
 
 	/* Find the native mode if this is a digital panel, if we didn't
-- 
2.41.0

