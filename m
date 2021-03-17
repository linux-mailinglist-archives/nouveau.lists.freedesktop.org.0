Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D033FB5F
	for <lists+nouveau@lfdr.de>; Wed, 17 Mar 2021 23:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756356E853;
	Wed, 17 Mar 2021 22:42:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A226E854
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 22:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616020953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7jQvqpzKxZc3/em+C5JBun90tKAacfvOMrjP/KcY+o=;
 b=WeEHglTS1rAsUmqwKr4/Hu1QJvIZrj/lQ93Mcnm00IIiTpdep/cJtyjmLVHQy61vAuvsyM
 0mtKTcLrL0hLtelu9ucbWeaxuiTKbwRiDecorNyQNylwetNOneqwIXGUCvgvHItOyaIgiz
 F2y57UZ1C/Ifzoneo23Iq6HDNoPX/9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-gqtHYTxGNoKHSZSB6cfKew-1; Wed, 17 Mar 2021 18:42:31 -0400
X-MC-Unique: gqtHYTxGNoKHSZSB6cfKew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3A27107ACCA;
 Wed, 17 Mar 2021 22:42:29 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 337971001281;
 Wed, 17 Mar 2021 22:42:29 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 17 Mar 2021 18:42:20 -0400
Message-Id: <20210317224222.447100-2-lyude@redhat.com>
In-Reply-To: <20210317224222.447100-1-lyude@redhat.com>
References: <20210317224222.447100-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t 1/3] tests/kms_color: Don't opencode
 igt_check_crc_equal()
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_color.c        | 2 +-
 tests/kms_color_helper.c | 6 ------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index f2686f57..705c9160 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -506,7 +506,7 @@ static bool test_pipe_ctm(data_t *data,
 		/* Verify that the CRC of the software computed output is
 		 * equal to the CRC of the CTM matrix transformation output.
 		 */
-		ret &= crc_equal(&crc_software, &crc_hardware);
+		ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ac8e8454..5f223a88 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -245,12 +245,6 @@ get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 	return drmModeGetPropertyBlob(data->drm_fd, prop_value);
 }
 
-bool crc_equal(igt_crc_t *a, igt_crc_t *b)
-{
-	return igt_skip_crc_compare ||
-		memcmp(a->crc, b->crc, sizeof(a->crc[0]) * a->n_words) == 0;
-}
-
 int
 pipe_set_property_blob_id(igt_pipe_t *pipe,
 			  enum igt_atomic_crtc_properties prop,
-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
