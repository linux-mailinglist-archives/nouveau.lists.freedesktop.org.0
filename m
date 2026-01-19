Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B7D3A31E
	for <lists+nouveau@lfdr.de>; Mon, 19 Jan 2026 10:32:15 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3510E3A7;
	Mon, 19 Jan 2026 09:32:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B84244CA9;
	Mon, 19 Jan 2026 09:23:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768814612;
 b=sBjQbcpUDPNNmarw8IBFrCC5V+KvJvf14TaZJA0QzrRW/SnGc5hbSCH1vx14f0zphJ7gr
 /eUB+DBcEMRxDclV+QKaJaYSrim/gmykaeB7q0pSjqGUuPy8ebHk+Z8Ewg9D+LRBX4XOhdw
 5RHrPJ/49IUawhmIka0iImkaEaAC08F3p0jrVq4phoyfJz2qeDJw82TN6NphE2uh6G6Hna4
 HyjQly0W/O1eURpABYiCebEgptl8nX0f1e04tg2HI2vKo68TiozY2o7pka7pJuAOTd5O4vP
 7FHk0jq8ZuvfbOdXRpI3yE300q+QKkmKx1LjJnHkXILzbc+wGT6XKqssH0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768814612; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hJ9OufFKQYgFvw0LaFqw8AkIVk/NBUz6prc1NJnJBzA=;
 b=RaGJK78q3pApDq83ozBNsNHAuXYr5BZup56bU2b3NMxSy5mQD+hOam//TQnZ8730+tKs2
 LJY4C4cnDgZOYwxlo2j/wtsY0VBYWvGcMWZo5k9yE2674Ys8LMm9yGeHVkHHSPENDANF26m
 d7eP1FCpY6IrJkUQd3pAMF5BQ5vDGn8nxupyVZ4Adsj7Um1jbI6ULQIc3z89J9fs6tmZdSM
 8b+0JAPJ9XTux712kMcufSAsw6jT7K/J2iYHbNc6fTekoltDlUIFHc00kdILtuWYUFenF9E
 JupbDMIsTO9j6sy0ZPQ0bzoYRCGav/IQ9L4G/o3ZACHLERNS8FgOXUhmecOA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C578404B2
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 09:23:29 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA8C610E393
	for <nouveau@lists.freedesktop.org>; Mon, 19 Jan 2026 09:32:10 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64d0d41404cso7189357a12.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 19 Jan 2026 01:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815129; x=1769419929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ9OufFKQYgFvw0LaFqw8AkIVk/NBUz6prc1NJnJBzA=;
        b=mbJ7/NYV9hay4E2+YA8/lD9og/7YrzIBg3rdSBRQiqLXQxZLd6YrlJ3+b/dMjN8E0A
         BUGJq/nrRU4vNPEAEYJBOhr7TfYBsuPpsx9Eqv9RQoRp8XpbC3nS+3I7MQpIqkVNfRAK
         bh5Ah+IxeFUAADmWyQL/YKww2dikr5jrREi+9+Ovnoanj7B7H/tgsh7NkABu96KetuVZ
         G+u3+VbTy4YSdObaJtE8Mn6fB8XX2Lmg71aG/2hxoc1VdC6Pkgvv8HwggcyGidl/Woo5
         Rh1RGluQoIqzIhzWsfar0d4tjFkpEkgactDFeINuLOUoRO+DbE6t4Zfr87EnTRfawU2m
         FKoQ==
X-Gm-Message-State: AOJu0YwY6KdtjAtGHYYDj5MqrAP4EGJXbLAcnSyVEDLBYVtFaIE8/skU
	jNkNCgLvEocBHaAlXkXNUEDqyzS7u1tYuXsVuXruNPJYE/6U8fhHNLBpmx3vpcwK
X-Gm-Gg: AY/fxX749y1qlbr9fxb21x/fOpWttOSRWNufkz7OB/FiW2DAGd+6UTRx+GzXENClJxz
	ECryHHW0DzHIH8qs4GgoranUTkPEWoc7aZrFI5qFPC+3H7cIu5FJH4d+UnXtgpAwIhZw9EAuUs2
	dZ7gV84gzmDz/cEiBiEaFcj0F05A2WlWYQxICN6o22ggrpCiGHolItGqcW97I/jpQOzHJS02LAl
	zJXsFxe+zAF3QERtJPpoJqRwUeal57pMjhkIYM3CE66DGb+HQ++2HbXPjBw3IPqtj032BVt6AF5
	yuJNIfhL9UaZiGJR55c9yVs3qogAfEdOP2DGEQzTLmf7kpq3Q0N5H1l/bcB+7f1xTYnjFqIjFJo
	3VRmdnv82sEqjoZHM7WRDo5Tu9uHHkHnQMKpRFsENcIZsCxzrh0IPbVRFMK/wBQuHdt4Tbs83Q4
	d/stDQexNAPLyPbs1ghUq1N8MH
X-Received: by 2002:a05:6402:42c1:b0:647:9380:103c with SMTP id
 4fb4d7f45d1cf-654525cbeb1mr8928016a12.13.1768815129064;
        Mon, 19 Jan 2026 01:32:09 -0800 (PST)
Received: from linux-gentoo ([158.47.224.235])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654533cc5ecsm9751331a12.16.2026.01.19.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 01:32:08 -0800 (PST)
Date: Mon, 19 Jan 2026 10:32:09 +0100
From: Giuseppe Ranieri <giuseppe@ranieri.dev>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH] Fix scdc implementation missing in GK208B NVidia Card
 (gk104_sor_hdmi)
Message-ID: <aW36GUMAh4of3Ymg@linux-gentoo>
References: <aWuZfMo5cMLwNRax@linux-gentoo>
 <526db1d7a9122c8fe4557d6ee6950cf0e31e516c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <526db1d7a9122c8fe4557d6ee6950cf0e31e516c.camel@redhat.com>
Message-ID-Hash: SNWPC3CO6ZTWK5FRKBZLOZYYM6TIQ5YN
X-Message-ID-Hash: SNWPC3CO6ZTWK5FRKBZLOZYYM6TIQ5YN
X-MailFrom: rgiuse@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SNWPC3CO6ZTWK5FRKBZLOZYYM6TIQ5YN/>
Archived-At: <https://lore.freedesktop.org/aW36GUMAh4of3Ymg@linux-gentoo/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


Add scdc function to gk104_sor_hdmi
Fix the card initialization on card GK208B, the code path is shared by
 -  "GK110"
 -  "GK110B"
 -  "GK208B"
 -  "GK208"

Fix HDMI audio missing  problem.


Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219561 and
+https://gitlab.freedesktop.org/drm/nouveau/-/issues/402
Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
---

diff '--color=auto' -ur a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c	2025-11-30 23:42:10.000000000 +0100
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c	2026-01-16 19:03:51.175827296 +0100
@@ -106,6 +106,7 @@
 const struct nvkm_ior_func_hdmi
 gk104_sor_hdmi = {
 	.ctrl = gk104_sor_hdmi_ctrl,
+	.scdc = gm200_sor_hdmi_scdc,
 	.infoframe_avi = gk104_sor_hdmi_infoframe_avi,
 	.infoframe_vsi = gk104_sor_hdmi_infoframe_vsi,
 };
 
