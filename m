Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0472507AF
	for <lists+nouveau@lfdr.de>; Mon, 24 Aug 2020 20:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2286E174;
	Mon, 24 Aug 2020 18:33:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF956E174
 for <nouveau@lists.freedesktop.org>; Mon, 24 Aug 2020 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598293981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cqaEpyDhkmI96PHzH29nGlo28Yqsw/ZMe9xRHGJS6BM=;
 b=Mo1F32JhfggyDAm/BXNq50rLwVFWw3BFKXnut6dX2D2gTyjK1J083tNVQpT6hM8gUsvaZe
 owy+cvEjKbm2056cGLt3wNqlHLzcdxpstwXWzkKnP0fCOJv7tKGRuU3f1Zkw2LKs/s9A6h
 kIoZ8lJFxtMM1UMmMkRxMH3mQ6q0HBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Txh2TMpTNkuN7-QsbuaDBQ-1; Mon, 24 Aug 2020 14:32:59 -0400
X-MC-Unique: Txh2TMpTNkuN7-QsbuaDBQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 681C110ABDAB;
 Mon, 24 Aug 2020 18:32:58 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-114-60.rdu2.redhat.com
 [10.10.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3B6E5C1DA;
 Mon, 24 Aug 2020 18:32:57 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	Sasha Levin <sashal@kernel.org>
Date: Mon, 24 Aug 2020 14:32:51 -0400
Message-Id: <20200824183253.826343-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/2] drm/nouveau: Backport SOR/PIOR probing fixes
 for v5.8
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

These didn't apply cleanly to v5.8, so here's a backported version.

Lyude Paul (2):
  drm/nouveau/kms/nv50-: Program notifier offset before requesting disp
    caps
  drm/nouveau/kms/nv50-: Log SOR/PIOR caps

 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 10 +++++++++
 2 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
