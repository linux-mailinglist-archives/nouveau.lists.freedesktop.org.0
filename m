Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7627F08F
	for <lists+nouveau@lfdr.de>; Wed, 30 Sep 2020 19:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C476E802;
	Wed, 30 Sep 2020 17:32:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711A06E802
 for <nouveau@lists.freedesktop.org>; Wed, 30 Sep 2020 17:32:04 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601487123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/bTJEkqVaj313wlfgmn58h+Y2LuBYS+KyIev25JRPA=;
 b=Yd4R+wpB20FDxjiTeRbr/e0ZUDCKHVwSCJLJAXSozdTBqXV4GELtIjw0OOEHcHQcNX83v0
 uGuzP56SWE8yJ7bEr9nn93VqgxBH4lmmr2viW7zk+YlksDOXciFvUVNZLBIMt1nzR19vQn
 yl3Z9lDoA5UUIgjMZLPP47akJ/8KsvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-CpPladuQP6WrfBIe4UnAMA-1; Wed, 30 Sep 2020 13:32:00 -0400
X-MC-Unique: CpPladuQP6WrfBIe4UnAMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75869801F99;
 Wed, 30 Sep 2020 17:31:57 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-194.rdu2.redhat.com [10.10.118.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD7F78806;
 Wed, 30 Sep 2020 17:31:56 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Sep 2020 13:31:49 -0400
Message-Id: <20200930173150.431995-5-lyude@redhat.com>
In-Reply-To: <20200930173150.431995-1-lyude@redhat.com>
References: <20200930173150.431995-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v5 4/5] lib/igt_kms: Hook up connector
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
 lib/igt_kms.c | 5 +++++
 lib/igt_kms.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4023811a..7946555d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -425,6 +425,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
 	[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS] = "WRITEBACK_PIXEL_FORMATS",
 	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
 	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
+	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
 };
 
 /*
@@ -1825,6 +1826,9 @@ static void igt_output_reset(igt_output_t *output)
 		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
 		output->writeback_out_fence_fd = -1;
 	}
+	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
+					 "off");
 
 }
 
@@ -1840,6 +1844,7 @@ static void igt_output_reset(igt_output_t *output)
  * - %IGT_CONNECTOR_BROADCAST_RGB (if applicable)
  *   %IGT_CONNECTOR_CONTENT_PROTECTION (if applicable)
  *   %IGT_CONNECTOR_HDR_OUTPUT_METADATA (if applicable)
+ * - %IGT_CONNECTOR_DITHERING_MODE (if applicable)
  * - igt_output_override_mode() to default.
  *
  * For pipes:
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index f41eadaf..6ad1a7ef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -132,6 +132,7 @@ enum igt_atomic_connector_properties {
        IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS,
        IGT_CONNECTOR_WRITEBACK_FB_ID,
        IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
+       IGT_CONNECTOR_DITHERING_MODE,
        IGT_NUM_CONNECTOR_PROPS
 };
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
