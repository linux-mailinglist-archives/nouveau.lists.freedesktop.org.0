Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309A18934D
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 01:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F85B6E84B;
	Wed, 18 Mar 2020 00:49:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED086E849
 for <nouveau@lists.freedesktop.org>; Wed, 18 Mar 2020 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584492561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uTjRMxfF3jcZQSFvm5cG6PvRtcyiO1bqx3rGTQEQBsg=;
 b=iimWh4sI2kX0q83lnByun5oLxWv88tF2bqLspoNkz4tp7sHpchJs2Txum5/WG06GhOgrBp
 32iVIAYVn5pifoOIQRZUfWtqvIza0YaIoENA9gMxRqmrcrTsHGuOrFnqGzRYtNCNRbqS9p
 aLsxNhwfSRvTOu4JbsvS3S6OXBU6HB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-P99QcqTjNXyc9DDJX-ss6g-1; Tue, 17 Mar 2020 20:49:19 -0400
X-MC-Unique: P99QcqTjNXyc9DDJX-ss6g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26A72800D50;
 Wed, 18 Mar 2020 00:49:18 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-113-173.rdu2.redhat.com
 [10.10.113.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B02B210016EB;
 Wed, 18 Mar 2020 00:49:17 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2020 20:49:13 -0400
Message-Id: <20200318004914.236815-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 1/2] tests/kms_pipe_crc_basic: Use
 igt_display_require_output_on_pipe()
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

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 tests/kms_pipe_crc_basic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index d169b7bd..f121e27e 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -65,15 +65,14 @@ static void test_bad_source(data_t *data)
 static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
+	igt_output_t *output;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
 	int c, j;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
-	igt_require_f(output, "No connector found for pipe %s\n",
-		      kmstest_pipe_name(pipe));
+	igt_display_require_output_on_pipe(display, pipe);
+	output = igt_get_single_output_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	igt_output_set_pipe(output, pipe);
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
