Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A41AE74E
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 23:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490EB6EB47;
	Fri, 17 Apr 2020 21:10:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3127D6EB25
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 21:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587157836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i80sITLz+oOVttfOMtjBIkDo3ypFSAfdKikT8dtYqxA=;
 b=cMLVHHU+cPQB8HaTHtgbvi2m47BNiQcl5kwve6oKzNzYd1Kce2msj47qtGRC13ANQzJwvV
 iqnrI1tikrx0SBWiw2d8Wl6AujzmzZ9tqeMuUqcIi2K8AF7tRuT6NZlMmMLmaVp9l1X838
 lgwK7VHKuD/42EtynopqkH2CvnLJT/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-ezoSuFzpMBmfKqGU7vtOzA-1; Fri, 17 Apr 2020 17:10:34 -0400
X-MC-Unique: ezoSuFzpMBmfKqGU7vtOzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23DB5107ACC4;
 Fri, 17 Apr 2020 21:10:33 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8086D5C28E;
 Fri, 17 Apr 2020 21:10:32 +0000 (UTC)
From: Lyude <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Fri, 17 Apr 2020 17:10:23 -0400
Message-Id: <20200417211025.109574-4-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
References: <20200417211025.109574-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH i-g-t v3 3/5] lib/igt_debugfs: Add
 igt_debugfs_pipe_dir()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_debugfs_connector_dir(), but for pipes instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_debugfs.c | 29 +++++++++++++++++++++++++++++
 lib/igt_debugfs.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
index bf6be552..3c3b11e1 100644
--- a/lib/igt_debugfs.c
+++ b/lib/igt_debugfs.c
@@ -260,6 +260,35 @@ int igt_debugfs_connector_dir(int device, char *conn_name, int mode)
 	return ret;
 }
 
+/**
+ * igt_debugfs_pipe_dir:
+ * @device: fd of the device
+ * @pipe: index of pipe
+ * @mode: mode bits as used by open()
+ *
+ * This opens the debugfs directory corresponding to the pipe index on the
+ * device for use with igt_sysfs_get() and related functions.
+ *
+ * Returns:
+ * The directory fd, or -1 on failure.
+ */
+int igt_debugfs_pipe_dir(int device, int pipe, int mode)
+{
+	char buf[128];
+	int dir, ret;
+
+	dir = igt_debugfs_dir(device);
+	if (dir < 0)
+		return dir;
+
+	snprintf(buf, sizeof(buf), "crtc-%d", pipe);
+	ret = openat(dir, buf, mode);
+
+	close(dir);
+
+	return ret;
+}
+
 /**
  * igt_debugfs_open:
  * @filename: name of the debugfs node to open
diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
index 7d1a6175..15741a40 100644
--- a/lib/igt_debugfs.h
+++ b/lib/igt_debugfs.h
@@ -36,6 +36,7 @@ char *igt_debugfs_path(int device, char *path, int pathlen);
 
 int igt_debugfs_dir(int device);
 int igt_debugfs_connector_dir(int device, char *conn_name, int mode);
+int igt_debugfs_pipe_dir(int device, int pipe, int mode);
 
 int igt_debugfs_open(int fd, const char *filename, int mode);
 void __igt_debugfs_read(int fd, const char *filename, char *buf, int size);
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
