Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AD58A217
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92A1A6F49;
	Thu,  4 Aug 2022 20:37:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A30010F0FE;
 Mon, 13 Jun 2022 07:45:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2E50D21A93;
 Mon, 13 Jun 2022 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1655106304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5WMle8KoXV0j63rwJ5QZ4pysRjmykK+gll6/m96aiCQ=;
 b=FuLo+VOBBkI+oWNStM4seHkoiyK0Hr+aHMOvDiwt9GGELjWedVV4eVmmgJbe872jPvORqJ
 Vc5aqY4498GBGJEsynJOBtP7uacBYTxS6Qceg9YAfnVQkKLxppmCRYRI6VnRd0Ehidw6e7
 VkwY4jb2uXaKjgqii9bZJVgtGLmxSos=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id B0E0C2C141;
 Mon, 13 Jun 2022 07:45:03 +0000 (UTC)
Date: Mon, 13 Jun 2022 09:45:01 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <Yqbq/Q5jz2ou87Jx@dhcp22.suse.cz>
References: <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
 <YqIMmK18mb/+s5de@dhcp22.suse.cz>
 <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
 <YqMuq/ZrV8loC3jE@dhcp22.suse.cz>
 <2e7e050e-04eb-0c0a-0675-d7f1c3ae7aed@amd.com>
 <YqNSSFQELx/LeEHR@dhcp22.suse.cz>
 <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:56 +0000
Subject: Re: [Nouveau] [PATCH 03/13] mm: shmem: provide oom badness for
 shmem files
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
Cc: andrey.grodzovsky@amd.com, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 hughd@google.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 linux-tegra@vger.kernel.org, alexander.deucher@amd.com,
 akpm@linux-foundation.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat 11-06-22 10:06:18, Christian König wrote:
> Am 10.06.22 um 16:16 schrieb Michal Hocko:
[...]
> > > So what happens when a games over allocates texture resources is that your
> > > whole desktop restarts because the compositor is killed. This obviously also
> > > kills the game, but it would be much nice if we would be more selective
> > > here.
> > > 
> > > For hardware rendering DMA-buf and GPU drivers are used, but for the
> > > software fallback shmem files is what is used under the hood as far as I
> > > know. And the underlying problem is the same for both.
> > For shmem files the end user of the buffer can preallocate and so own
> > the buffer and be accounted for it.
> 
> The problem is just that it can easily happen that one process is allocating
> the resource and a different one freeing it.
> 
> So just imaging the following example: Process opens X window, get reference
> to the handle of the buffer backing this window for drawing, tells X to
> close the window again and then a bit later closes the buffer handle.
> 
> In this example the X server would be charged allocating the buffer and the
> client (which is most likely in a different memcg group) is charged freeing
> it.

Thanks for the clarification.

> I could of course add something to struct page to track which memcg (or
> process) it was charged against, but extending struct page is most likely a
> no-go.

Struct page already maintains is memcg. The one which has charged it and
it will stay constatnt throughout of the allocation lifetime (cgroup v1
has a concept of the charge migration but this hasn't been adopted in
v2).

We have a concept of active_memcg which allows to charge against a
different memcg than the allocating context. From your example above I
do not think this is really usable for the described usecase as the X is
not aware where the request comes from?

> Alternative I could try to track the "owner" of a buffer (e.g. a shmem
> file), but then it can happen that one processes creates the object and
> another one is writing to it and actually allocating the memory.

If you can enforce that the owner is really responsible for the
allocation then all should be fine. That would require MAP_POPULATE like
semantic and I suspect this is not really feasible with the existing
userspace. It would be certainly hard to enforce for bad players.
-- 
Michal Hocko
SUSE Labs
