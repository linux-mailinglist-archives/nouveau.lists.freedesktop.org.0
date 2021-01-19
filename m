Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DADB2FAE69
	for <lists+nouveau@lfdr.de>; Tue, 19 Jan 2021 02:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBC76E7D2;
	Tue, 19 Jan 2021 01:50:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759606E7D2
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611021009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S1YlRy9X2yHZXxfCBll+yPgBTI6Eee0fbY4pbDSwUw0=;
 b=f1RUgj8VYyB+5SDEk2Q/tnrsW63MQfZ32lnKuHGv0APZMC3zdhpIAY6pCjJAOOekIHg8k3
 WQqyt3ltEpAd2z1X3Bu9SUUleqYEe6+iZ/5bgaDMOsUQugODZG7zTPQf2P/0j5QTjj3qn8
 95UaiMS4GPip8l/2FJa7tsu0kTs1B9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-F5nX_FL2MC6Yroqqsx_8qA-1; Mon, 18 Jan 2021 20:50:07 -0500
X-MC-Unique: F5nX_FL2MC6Yroqqsx_8qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32679801817
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 01:50:06 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-113-206.rdu2.redhat.com
 [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEF6F1F471;
 Tue, 19 Jan 2021 01:50:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Mon, 18 Jan 2021 20:48:44 -0500
Message-Id: <20210119014849.2509965-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/5] drm/nouveau: CRC fixes
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

Over vacation I did a bunch of work on getting igt working for evo GPUs.
Note though some of these fixes are for nvdisplay GPUs, as I noticed a
couple of things along the way (like the fact that you CAN use the core
channel for tag updating on turing+, hooray!).

Lyude Paul (5):
  drm/nouveau/kms/nv50-: Use drm_dbg_kms() in crc.c
  drm/nouveau/kms/nv50-: Check vbl count after CRC context flip
  drm/nouveau/kms/nv140-: Use hard-coded wndws or core channel for CRC
    channel
  drm/nouveau/kms/nvd9-nv138: Fix CRC calculation for the cursor channel
  drm/nouveau/kms/nv140-: Add CRC methods to gv100_disp_core_mthd_head

 drivers/gpu/drm/nouveau/dispnv50/Kbuild       |  1 +
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        | 64 ++++++-----------
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |  7 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  8 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    | 45 +++---------
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h    | 40 +++++++++++
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    | 58 ++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clc57d.h   | 69 +++++++++++++++++++
 .../drm/nouveau/nvkm/engine/disp/coregv100.c  |  2 +
 10 files changed, 208 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc37d.h
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
