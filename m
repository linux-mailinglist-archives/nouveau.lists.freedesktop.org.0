Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002E203A59
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6036E81F;
	Mon, 22 Jun 2020 15:09:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEB289F63
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:31:15 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kxXM5thXz9vHdS
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZCOanFW6HcG for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:22:27 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kxXM4GLyz9vHdB
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 20:22:26 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kxXM4GLyz9vHdB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kxXM4GLyz9vHdB
Received: by mail-io1-f70.google.com with SMTP id c5so8843661iok.18
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWaD4fQyHbWq3bbusGJa3obvcK40dmIFPt4HBS/vC+8=;
 b=dnGgxZhWilGEvZAkDKg8+Db3hNX1+NOCy/4oK32fpCcuIBiSCLn37R9dMCTvR5yOnN
 m9KEtdopyhDK6ah8M4C/7Ae9EnXaPpr7b6yJHQL8m/jac7VXpHQVtKYFn8bmbq9lSJro
 ABG7Whrj7bznZW+sAz3bnIzAN9MG0WAH84cqBVbc+2zq+fJd22+zK1m/hZozqp6+NbrO
 +6OwzFLwRZau6lJ11+eb9xfW5Ew88zoMf1Wlg/Gw79N1J7+tFJJ6PK4TcLjrugCBhiro
 AgHbHwNXra0eLZ2T1ZjYU+QKKaraFrGqUywmBUY+NPz1nwRsriTRIle/R+A6z7qIMd3d
 FvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hWaD4fQyHbWq3bbusGJa3obvcK40dmIFPt4HBS/vC+8=;
 b=JCPTdxgrcUDWvUfF/9icKz2QFpO30WK+eViKexjuZ+G2wdn6rqiyAmgz5WBIJ5jkz+
 pVOTCJUTVr76Jzu+KIaoJuU3kP9xPEBQjOL4OBMcwa+xHv03Dn3NT6JBF4wIUFJ0DgtS
 lWQFieNHEJVoDzNcZy07VCpioOg3ezjOznqmY9ZeB9EHQHWFAe8VwOM0VIVFnOXnLwZN
 QU8cp8gG1DfQA7/gBfKN0zlg5aTty5q4ZmA23Z2zfe2Qbel7KhN4dgoaqBycCjKjSIDK
 lCFwIquDDLbvj8Y/qlEmGYxlkXROM5vMDOsh3HqOmX24akai9AfKViEodQonDe/Pwukn
 JCvQ==
X-Gm-Message-State: AOAM532zahmrSh9x33L62TYREaH0O/F/IIA47islrsgOrW/barX6z2Pj
 f8wkkuZdah9h3o0uG3EhoAUrbhiwZPShVsl0TT+u3164hrbUqsYuVT7PaCrrtTTvD6vy8PtAlIy
 fsLm7mKZzieYaJPHytL74ZPov9nwqIQ==
X-Received: by 2002:a5e:dd07:: with SMTP id t7mr21202637iop.21.1592097746389; 
 Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG9/5j6jwcpTDWma6pdM8Bkh2xp31WtVsWXYi2gCUmVJhMzt5E2i8yikc3nH8lOVjzJe+aTg==
X-Received: by 2002:a5e:dd07:: with SMTP id t7mr21202621iop.21.1592097746172; 
 Sat, 13 Jun 2020 18:22:26 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id j63sm5760966ilg.50.2020.06.13.18.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:22:25 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sat, 13 Jun 2020 20:22:23 -0500
Message-Id: <20200614012223.121019-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 15:09:59 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: Fix reference count leak in
 nouveau_connector_detect
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
Cc: wu000273@umn.edu, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nouveau_connector_detect() calls pm_runtime_get_sync and in turn
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 1b383ae0248f..ef8ddbe44581 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -572,8 +572,10 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 		pm_runtime_get_noresume(dev->dev);
 	} else {
 		ret = pm_runtime_get_sync(dev->dev);
-		if (ret < 0 && ret != -EACCES)
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_autosuspend(dev->dev);
 			return conn_status;
+		}
 	}
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
