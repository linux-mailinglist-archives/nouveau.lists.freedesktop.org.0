Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28451203A5E
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 17:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C250E6E82B;
	Mon, 22 Jun 2020 15:10:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 415 seconds by postgrey-1.36 at gabe;
 Sun, 14 Jun 2020 01:29:23 UTC
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3CE89C19
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:29:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kxhM234Sz9vY7K
 for <nouveau@lists.freedesktop.org>; Sun, 14 Jun 2020 01:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wju48eE1Bd9X for <nouveau@lists.freedesktop.org>;
 Sat, 13 Jun 2020 20:29:23 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kxhM0GjWz9vY6t
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 20:29:23 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kxhM0GjWz9vY6t
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kxhM0GjWz9vY6t
Received: by mail-io1-f70.google.com with SMTP id l204so8929837ioa.4
 for <nouveau@lists.freedesktop.org>; Sat, 13 Jun 2020 18:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2grYbPpWTCRicijBKU2oLG0fehNUWKsBMP/uZoFaP4=;
 b=ENLR6Uv6OYFB2FBobdBXjvIgmjG7TgPlMF4kIjLxf7/VKA9E9/zJVo5f5L6woaa0Mn
 o2B7YbIzyXva+i9dWkIaatyIdSo5EyHWlX+GrWPf/3vTnkUFdOazPQeLVRwsjeeU+yzo
 A4dvcMGyvp1+GEELbTFx3/eC1hsihbcXSIrD393b9DF2hmzjE/2KHZbse2hdZPDg8N9R
 CcUgdwS/1uDocUY0oeaCwNUm5ZSWSKGtqgR3uikep86JukPMtmEBnK+nZCA/gJ1I1FJj
 1QEMIBQpUFCSdmceEzCrOW5Zu0a1fF/ZL9XsFJhb81B8Ds2B5tf0UMYpdDf9OLhwr7fx
 bkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2grYbPpWTCRicijBKU2oLG0fehNUWKsBMP/uZoFaP4=;
 b=COXpKLTZlMucQ3jQkN4tSdQnqNIf8RtlDaujExXNdOP3nPlCkB2LhkodbejqfuuzXV
 gL/e82x3cj4JXMQP6K8q1nHtOtcIel8RWEH4up/yEe1eXF7pANZwjNQ2dggqwr3q7BMc
 ax1w98eFBGmVH+BwkNuINRvjwMWlqqKeW7fQyEMHaOcbVl7oU797Xx/c1mBlYrfi9YdV
 Ye0IsEm2heaITbBedIAdVC+cMPKv8RWqFLVkpImu+zDouyYNn20momyuNayAASzC1C8+
 vcbSuInRsK/qX6dt3uh5zcZz2Iuk4tl6iXhC+rrEsjBPmrE/+NNG5FNw6HL2CXVfKgC6
 dzng==
X-Gm-Message-State: AOAM531Zt4CRD2nbig0YnJtn/2jzmhDGF92KrvWdw5LjnkoTeqLfExrA
 RpJx2yS8R0HiU8zU/gmaSkyCeDFURIBQU8NiUnG9QxTslj2kiTf4LFFRzmtRvVwMMYlXDk56ro/
 CIE9kYDbYaFoTzH3j2CjNuRTpvmiXTg==
X-Received: by 2002:a92:d0a:: with SMTP id 10mr13099249iln.162.1592098162649; 
 Sat, 13 Jun 2020 18:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycMLCnYhfdrrzjxhUUQ64OpH4a0ic/KTaj5fbtI0gClLIryWVz5kdC9pcvawqEgmaNt7hJkA==
X-Received: by 2002:a92:d0a:: with SMTP id 10mr13099234iln.162.1592098162507; 
 Sat, 13 Jun 2020 18:29:22 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:d65:8ac4:1b02:86ac])
 by smtp.gmail.com with ESMTPSA id 18sm5424749ion.17.2020.06.13.18.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 18:29:22 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sat, 13 Jun 2020 20:29:18 -0500
Message-Id: <20200614012920.121567-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 15:09:59 +0000
Subject: [Nouveau] [PATCH] drm/noveau: fix reference count leak in
 nv50_disp_atomic_commit
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
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

nv50_disp_atomic_commit() calls calls pm_runtime_get_sync and in turn
increments the reference count. In case of failure, decrement the
ref count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d472942102f5..b4039907f0d6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2157,8 +2157,10 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 	int ret, i;
 
 	ret = pm_runtime_get_sync(dev->dev);
-	if (ret < 0 && ret != -EACCES)
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_autosuspend(dev->dev);
 		return ret;
+	}
 
 	ret = drm_atomic_helper_setup_commit(state, nonblock);
 	if (ret)
-- 
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
