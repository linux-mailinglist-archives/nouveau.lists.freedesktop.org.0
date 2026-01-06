Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFB7CFAE58
	for <lists+nouveau@lfdr.de>; Tue, 06 Jan 2026 21:21:35 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCEF10E553;
	Tue,  6 Jan 2026 20:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cxB15hbU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3441A44C9B;
	Tue,  6 Jan 2026 20:13:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767730398;
 b=p5iUj5f4R4qChJlyE3LThXaXt7oTgFj6Di7QW3ZSvq8v7GMNhoiWXVynggNpk6ey3mgFL
 eZkVu1ge0OtxRuLvzVUgwQCTZ7x7ouep1Hf+1gI3YPWZwVbWNd5LEGT37tHR8ulQYaSQUe9
 45hNv9O6dHWvFCVcANeGJ82f/J5Iw295BoXq2clbPHIlslm+BAPuGYxyoBI2fM9/HIl+rF3
 XTGn92cciiteNpFjpuU+89/VuL/SH0rzNQyHX/Ql7M/8ZEbXqDJgEez+yXbHpFIrezZJdSM
 3BtP40b8sZh/0BVDjLpA5WcX2qWrk2rZgSUCn8OIHOpn6CCJKcV0s6qpPHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767730398; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dRttoEGXf8+AxdJ4Qz2K/5ZHz9p02Yv5zFthigDuipw=;
 b=VohiIClAlpq/EZtMZjcr6uYz34iJgVS+PQyTxj0q3eykzlQOWBa6Mj3JExhdtSffG7+Vn
 bivyZdVpR/JGbKEPj2A8D8eafEZbgtjRXamPRCYJyDQ/2mwxKzDqu+Z1l/kyKdMCVxWM2Tt
 vYN3A/mBx/ZbPywvjNt+8GF9/uI4ZR0L3QdJLwMX+dhy5Ix4ZxUD96P0hxWAwHf80UQQTFJ
 nvfYy0NTkXtRYeMWTd7U6GucJ5Vhcfil6wu55bIQR83N3iMXnc0YqfLcy4Lc0tSngmDz1bR
 wjiWfvb3PtbOFzn8HC0sscWWPv8Nd3+/GQ6WLUb1tPUlie8h0kpILrKdJhcg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EB7B344BB6
	for <nouveau@lists.freedesktop.org>; Tue,  6 Jan 2026 20:13:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9479510E54D;
	Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 461D5416C5;
	Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1741DC116C6;
	Tue,  6 Jan 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767730889;
	bh=6GymsSAJrMjlRhgGj673uy56XTGzYQmCI3sPLDhWRlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cxB15hbUwXzN9cJRtD1xTuBJosvLrbTIfgPCQf7gYa6tjI6u1IfBGUtNSSDG64wOm
	 o/8YuOAJqiOxUYR4jpglpx5BIq/Yg1do4jX1qYjAGxQ+dMn1M8ijTiVPVOzcvOku3e
	 fUB5qAsw3B4U6PPdcE7j+wlBXqgGMbyk5y/aljODx6Fq5Hxlcoc/6MKShaoqlK9o3h
	 Pf5RVEpEPCqvgG7Bq/lkg38nfMV9kQRgdYu34eDf9FI6R8QaC0pPPHzZwgDARJBcpF
	 +lEoGdK+14id5uZqBmWtYnOwYXD8wwgDwYsCaUD3I0qFmLvIwRjdYCGQkHbGqtpdwt
	 OeClmWJQxAe4A==
Date: Tue, 6 Jan 2026 12:21:28 -0800
From: Kees Cook <kees@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3][next] drm/nouveau: fifo: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <202601061220.EDD0476@keescook>
References: <aJ17oxJYcqqr3946@kspp>
 <e1009d16-cadb-4446-aef5-4a52197551a4@embeddedor.com>
 <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4e596b0-4e6d-40b8-933c-f407f2cc0980@kernel.org>
Message-ID-Hash: GKDTX6UFGJGZAFDTKMUZZGWUWZ564B2X
X-Message-ID-Hash: GKDTX6UFGJGZAFDTKMUZZGWUWZ564B2X
X-MailFrom: kees@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GKDTX6UFGJGZAFDTKMUZZGWUWZ564B2X/>
Archived-At: <https://lore.freedesktop.org/202601061220.EDD0476@keescook/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jan 06, 2026 at 09:14:36PM +0100, Danilo Krummrich wrote:
> On 1/6/26 7:08 AM, Gustavo A. R. Silva wrote:
> > Friendly ping: who can take this, please?
> For some reason this patch wasn't tagged for applying in my inbox -- seems like
> it slipped through.
> 
> I was about to pick it up, but recognized just in time that Kees already took it
> through his hardening tree.

Ah great!

> Sorry for the delay; thanks Kees for picking it up. Even though already applied,
> please consider this patch:
> 
> 	Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks! I had figured it was slipping through the cracks so I snagged
it. I'll add your Ack. :) If you'd rather take it, just say the word and
I can drop it from my tree.

-Kees

-- 
Kees Cook
