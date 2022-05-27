Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A7E5383BB
	for <lists+nouveau@lfdr.de>; Mon, 30 May 2022 16:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0D710E132;
	Mon, 30 May 2022 14:46:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 916 seconds by postgrey-1.36 at gabe;
 Fri, 27 May 2022 04:38:09 UTC
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com
 [162.62.57.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B858610E324
 for <nouveau@lists.freedesktop.org>; Fri, 27 May 2022 04:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1653626286; bh=lVrj+B/OXD3/d9PND/gW3vEGIbfEhk331+xQfhE35V8=;
 h=From:To:Cc:Subject:Date;
 b=crGSBPWE2+wVdeTSSKAwCWx5JH3tnKKqaUYCM39GUvQEzx6csCbeDT/twCNoY76mY
 dh8BJuGnUrMIkZUkyFVYmOv4ayfXB98bkYIndDT6lZcQtozQsdHT2eUaOw/8v0OBgz
 P2MMvjH8uT15adieP4PuZF6IpYOriE7ZRnZpf16o=
Received: from localhost.localdomain ([116.128.244.169])
 by newxmesmtplogicsvrszc7.qq.com (NewEsmtp) with SMTP
 id 5AEBC498; Fri, 27 May 2022 12:22:46 +0800
X-QQ-mid: xmsmtpt1653625366tnj5gygud
Message-ID: <tencent_655C23622640268A069B49A6A5ADDEECB508@qq.com>
X-QQ-XMAILINFO: MK5U7QanZrCwqCwSYwSirFlzWFG5zIgOyTkGd65Vft9mgbp5DdonQm/3PwkaOP
 SYRJX5dTFxkoCB5E+yvhAumKkQtTuTrmfQQVwBXCfZn53K40Kv8JjrnXeGvf/oF7nB8yupW++14c
 ppWtWH4CpwhrJAn6gA0fTV5sda3SjqQTDYeMRjI0Y9QKNzQzmwfYlOnXgU/JqwuiJaXSt6MO977W
 ATXoarLSv43QYqrXqdjaV4CDmejRWHMpDaTPLv0j8Q0kylSNC+KjWVwwcRIZRJm6Kf89hEnz+zH7
 1TMLyJOWfienc5irCgKeFcOACRisOURYrUCr2v9yKQ6ODRaJbk5eEpL/APumk0bjdT0Yl3AGBW70
 RLEMR94FW4EZi9NnFRK4EqmLuO3zr7C0BODS4D0J6j10vLQHbDq7R9K3NocEjT4tY0DPD/Y3fNhV
 83wOqwUGWTpxHr0TOY6dldb2y8af8iWpljVEJ6oYCL/DaiGMYWqokFg7p4iGBZAhSiO5GxGdF+xz
 za/T/QSFHo5HWjFKy7kWYYqMlZuwB9XPAUapZGAIQzTEn9cm1ZkUCC9Oyq8O0OaM1Iu+kIUEND7S
 pV3lT9UDIFROtrgEcYdbKIFKbbxtrhNlDeTrILQaS6WTDVGwOCUqoLxSNDXalQCwromacjY9mZyH
 /99BbTYgD+OQFSAMPD/nQufvHCkEWi/JSe4lALIJARnCMLBh2nsIYD/8DrIkpt8HaN0sV7a2kt5J
 PEAufnqL8ETZy7aKqwaYDKQAS4KgA/W7BWaL8fzMpqOWYCV1KVgmQ1xwJQQHFO9gLmrLA5YdpI8I
 cX3FeJE/Qk2gMM7QDKeec2pGnRcBDjvhEmTJ4lhWLdgzWG+LsIlOnG5rXMwMSazQGdxmPlX4HFlh
 JAHPG2MTlAvgavR3VroC8ALqu4SAckpToqm8stTgtC7eXfvNj4WkFXYYlo3RhI1A==
From: 1064094935@qq.com
To: Ben Skeggs <bskeggs@redhat.com>
Date: Fri, 27 May 2022 12:22:24 +0800
X-OQ-MSGID: <20220527042224.1205232-1-1064094935@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 14:46:50 +0000
Subject: [Nouveau] [PATCH 5/5] drm/nouveau: Fix spelling typo in comments
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pengfuyuan <pengfuyuan@kylinos.cn>, Daniel Vetter <daniel@ffwll.ch>,
 k2ci <kernel-bot@kylinos.cn>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: pengfuyuan <pengfuyuan@kylinos.cn>

Fix spelling typo in comments.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/nouveau/include/nvhw/drf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/drf.h b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
index bd0fc41446e2..d6969c0e2f29 100644
--- a/drivers/gpu/drm/nouveau/include/nvhw/drf.h
+++ b/drivers/gpu/drm/nouveau/include/nvhw/drf.h
@@ -190,7 +190,7 @@
 #define DRF_MD_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,_10,IMPL,...) IMPL
 #define DRF_MD(A...) DRF_MD_(X, ##A, DRF_MD_I, DRF_MD_N)(X, ##A)
 
-/* Helper for testing against field value in aribtrary object */
+/* Helper for testing against field value in arbitrary object */
 #define DRF_TV_N(X,e,p,o,d,r,  f,cmp,v)                                          \
 	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, (v))
 #define DRF_TV_I(X,e,p,o,d,r,i,f,cmp,v)                                          \
@@ -198,7 +198,7 @@
 #define DRF_TV_(X,_1,_2,_3,_4,_5,_6,_7,_8,_9,IMPL,...) IMPL
 #define DRF_TV(A...) DRF_TV_(X, ##A, DRF_TV_I, DRF_TV_N)(X, ##A)
 
-/* Helper for testing against field definition in aribtrary object */
+/* Helper for testing against field definition in arbitrary object */
 #define DRF_TD_N(X,e,p,o,d,r,  f,cmp,v)                                                          \
 	NVVAL_TEST_X(DRF_RD_X(e, (p), (o), d##_##r   ), d##_##r##_##f, cmp, d##_##r##_##f##_##v)
 #define DRF_TD_I(X,e,p,o,d,r,i,f,cmp,v)                                                          \
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus
