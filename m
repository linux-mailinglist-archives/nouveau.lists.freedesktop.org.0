Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124218934C
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 01:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B98E6E848;
	Wed, 18 Mar 2020 00:49:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE226E84A
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egkfNWi4FIbuUQtS7KwWyAz1mUx1dyIa7GhOggIppfc=;
 b=IV0gq37Naa8zWsyaP5rSPta+Ox5pBzVv9sbgVqLcCvz0Vln0F9aH/JCEgiEy5XiYzVC4xR
 FK7M7uzYC48EF3626TLdX/1tJHI8zBW5jK86DFCVIXlq26CavFB/yrIsXLTv0uvkKKOkud
 DybnTo1tjmQWzVgfxN1wjUfQtW3NxAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-N2ddM2PcMumUst3lhe5InA-1; Tue, 17 Mar 2020 20:49:19 -0400
X-MC-Unique: N2ddM2PcMumUst3lhe5InA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B816213E2;
 Wed, 18 Mar 2020 00:49:18 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 499B410016EB;
 Wed, 18 Mar 2020 00:49:18 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:49:14 -0400
Message-Id: <20200318004914.236815-2-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
References: <20200318004914.236815-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 2/2] tests/kms_pipe_crc_basic: Add
 disable-crc-after-crtc-pipe-* tests
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

I ended up hitting some bugs when writing nouveau's CRC implementation
due to incorrectly handling the situation where we disable CRCs on a
pipe that already been disabled, which ended up causing some other vague
igt issues when running certain tests in multi-mode.

So, let's add a trivial test for this scenario while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_pipe_crc_basic.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f121e27e..4a58332a 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -152,6 +152,41 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 	}
 }
 
+static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output = igt_get_single_output_for_pipe(&data->display, pipe);
+	igt_pipe_crc_t *pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
+	drmModeModeInfo *mode = igt_output_get_mode(output);
+	igt_crc_t crc[2];
+
+	igt_display_reset(display);
+	igt_output_set_pipe(output, pipe);
+
+	igt_create_color_fb(data->drm_fd,
+			    mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888,
+			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.0, 1.0, 0.0, &data->fb);
+	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
+	igt_display_commit(display);
+
+	igt_pipe_crc_start(pipe_crc);
+	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc[0]);
+
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_pipe_crc_stop(pipe_crc);
+
+	kmstest_set_connector_dpms(data->drm_fd, output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc[1]);
+	igt_assert_crc_equal(&crc[0], &crc[1]);
+
+	igt_pipe_crc_free(pipe_crc);
+	igt_remove_fb(data->drm_fd, &data->fb);
+}
+
 data_t data = {0, };
 
 igt_main
@@ -196,6 +231,9 @@ igt_main
 			test_read_crc(&data, pipe, 0);
 		}
 
+		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
+			test_disable_crc_after_crtc(&data, pipe);
+
 		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
 			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
 
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
