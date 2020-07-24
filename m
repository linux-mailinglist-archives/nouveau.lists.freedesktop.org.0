Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B512722CB9E
	for <lists+nouveau@lfdr.de>; Fri, 24 Jul 2020 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6A16E149;
	Fri, 24 Jul 2020 17:05:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F576E149
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jul 2020 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595610307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EkhpS3wqaNXO4cxa/b8xv7UQUnqRm4iM9Bn4hHqzUoE=;
 b=DhkRzNfm0iSeyW9Bjgig/ttBgbO/aT+lmlgnioJRHAb9keoU/ZUHRNW0ff7y58U8XlSe0G
 6F4HWGDr1ZeAm1fhUjGSB8VuBrUezWQmeuTcfRL3FofY6L3ryMmrxVTMFDjcZ241XGcsJw
 bIxGkU3TUZ01CwdBA3QzKhi3WpunnuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-UiscuXF7NBy_TGDG_1_okA-1; Fri, 24 Jul 2020 13:05:04 -0400
X-MC-Unique: UiscuXF7NBy_TGDG_1_okA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D311B800597;
 Fri, 24 Jul 2020 17:05:03 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-175.rdu2.redhat.com
 [10.10.119.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17D7869332;
 Fri, 24 Jul 2020 17:05:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Date: Fri, 24 Jul 2020 13:04:55 -0400
Message-Id: <20200724170457.711072-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/2] drm/probe_helper,
 drm/nouveau: Validate MST modes against PBN
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

Now that we've added the hooks that we've needed for this and used them
in i915, let's add one more hook (which I could use some feedback on,
I'm not sure if it's worth maybe just reworking how we do mode pruning
in nouveau instead...) and start using this in our mst ->mode_valid
callback to filter out impossible to set modes on MST connectors.

Lyude Paul (2):
  drm/probe_helper: Add drm_connector_helper_funcs->get_modes_ctx()
  drm/nouveau/kms/nv50-: Check MST display modes against available PBN

 drivers/gpu/drm/drm_probe_helper.c          | 11 +++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 41 ++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  4 +-
 include/drm/drm_modeset_helper_vtables.h    | 42 +++++++++++++++++++++
 5 files changed, 104 insertions(+), 18 deletions(-)

-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
