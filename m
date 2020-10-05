Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB92836F6
	for <lists+nouveau@lfdr.de>; Mon,  5 Oct 2020 15:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8FA89BF6;
	Mon,  5 Oct 2020 13:52:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43E689BF6
 for <nouveau@lists.freedesktop.org>; Mon,  5 Oct 2020 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601905956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8LrvgSMEy0OW3u7P5u1NwYL6Dim/2UCsxVor06D3D0I=;
 b=LUc1Irt62wSQc59PYZdlvy5SDHbqAu5kakEHFledLE1zBAZJkiKvW6yFcaaBLbsjGk3ySQ
 0a9K7WriUvF0ebf2quj+Rq2u7KGL6T+n7Nw9XLHWHWobh9KweQ+iNsK41nxNEnzQo+JgAh
 mojDD1NwhPF+naN26s4t4wXw3LbY+ns=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-6AgqpEkNPQqPZJS04NI_QA-1; Mon, 05 Oct 2020 09:52:34 -0400
X-MC-Unique: 6AgqpEkNPQqPZJS04NI_QA-1
Received: by mail-wm1-f70.google.com with SMTP id u5so1736554wme.3
 for <nouveau@lists.freedesktop.org>; Mon, 05 Oct 2020 06:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LrvgSMEy0OW3u7P5u1NwYL6Dim/2UCsxVor06D3D0I=;
 b=WzaV3UzHYuF082elUMumnnhVD9hvzO+5pO21x4iAE0zwNwFYNwswoALEl2fi/5gaJV
 3LwYSr1WzgFyzIMfaPH/fnBu6r2gNciZ8vk+guwWcOYviUUDglOPElrkiph8ljPwu9Cz
 1CxuFnQWUutJLaPgOTy0GkQYSeVyU4v7tNs2U6IVP4GxhJG9EzLP4fAFbA9TFTh68ZJC
 K1S/NtJchpXBfn76ahzVPNyHf1Gh8LEYB/+YNZc34OglQwg/XvicQxK64lRBTfTdyXJf
 iEYMv1JNZI97FRs8OcXQI6pPOt2bL9E/v9nK6PE0+DiEYTuzp4Ahv8CygjhKl/HAb4n3
 QVaQ==
X-Gm-Message-State: AOAM533BmwrHN3hWfd5EGRjClIHwvankiqXV74WBQv1+TDAK23DWW6qX
 oa3S7uHhU0328wxEydj6qCX10dHkWc3zElx+4UTacbSFhoCnpaVHIRpJ3aoxRHvRi6Xa56WvtQx
 7I6OxSkuuONakiqTneYC3eRhD/w==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr18052656wrw.331.1601905953296; 
 Mon, 05 Oct 2020 06:52:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsJMQPY1QDCQP/OP8alNI23ry5bX396PvBK//gJQtBh0jt7AMm8UFKheqAd8+OIyh5yTA8lQ==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr18052629wrw.331.1601905953051; 
 Mon, 05 Oct 2020 06:52:33 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id u81sm9875433wmg.43.2020.10.05.06.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:52:32 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon,  5 Oct 2020 15:52:30 +0200
Message-Id: <20201005135230.735914-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH] device: return error for unknown chipsets
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
Cc: dann frazier <dann.frazier@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Previously the code relied on device->pri to be NULL and to fail probing
later. We really should just return an error inside nvkm_device_ctor for
unsupported GPUs.

Fixes: 24d5ff40a732 ("drm/nouveau/device: rework mmio mapping code to get rid of second map")

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: dann frazier <dann.frazier@canonical.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 9f4ac2672..68d665414 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -3149,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x168: device->chip = &nv168_chipset; break;
 		default:
 			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
+			ret = -ENOSYS;
 			goto done;
 		}
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
