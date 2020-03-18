Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0618935E
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 02:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A8D6E849;
	Wed, 18 Mar 2020 01:00:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3413E6E260
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584493255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Dc1ULn4YGFeI4ydwqAywP+Suu9Wq8tVCS0P6gl9XSc=;
 b=JW+vdk/8H02w3eIWmcQIfFRuoMVPRLZ6mHLtnO9ngeIMQM4HLFCrOpdtaXUvPn+6tl/dn+
 brhe/+Yu58Z1P6Iz8YIg9rEWTSzU2Gl7tNBPjoo5I5nNfK3VS7g5ZaJU/VIgbdfUVm1rAF
 2FDWwNcoXLJiaBol5uWRRPGVL16FhHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-FQl-QZHyO86Z7NF_jC-t1A-1; Tue, 17 Mar 2020 21:00:53 -0400
X-MC-Unique: FQl-QZHyO86Z7NF_jC-t1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 431E18010C7;
 Wed, 18 Mar 2020 01:00:52 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B57AF60BFB;
 Wed, 18 Mar 2020 01:00:51 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 21:00:46 -0400
Message-Id: <20200318010047.237024-4-lyude@redhat.com>
In-Reply-To: <20200318010047.237024-1-lyude@redhat.com>
References: <20200318010047.237024-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 3/4] lib/igt_kms: Hook up connector
 dithering prop
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Nvidia display hardware provides a set of flexible dithering options for
CRTCs. This dithering is actually noticeable in the CRC output for all
available tap points, and can be seen as CRC values for identical frames
cycling between either 2 or 4 values repeatedly (each one of these
values is a different dithering phase applied to the source output). Of
course, this is very likely to break tests using CRC readback since we
don't expect the CRC to change if the source content hasn't changed.

So, hook up support for configuring the dithering property and reset it
to off from igt_display_reset() when applicable.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 54de45e5..2bbb363e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -418,6 +418,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_LINK_STATUS] = "link-status",
 	[IGT_CONNECTOR_MAX_BPC] = "max bpc",
 	[IGT_CONNECTOR_HDR_OUTPUT_METADATA] = "HDR_OUTPUT_METADATA",
+	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
 /*
@@ -1799,6 +1800,10 @@ static void igt_output_reset(igt_output_t *output)
 	if (igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA))
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_HDR_OUTPUT_METADATA, 0);
+
+	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
+					 "off");
 }
 
 /**
@@ -1813,6 +1818,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cd3fdbc0..998ed241 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -127,6 +127,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_LINK_STATUS,
        IGT_CONNECTOR_MAX_BPC,
        IGT_CONNECTOR_HDR_OUTPUT_METADATA,
+       IGT_CONNECTOR_DITHERING_MODE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
