Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88458A21F
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D96A6F6A;
	Thu,  4 Aug 2022 20:37:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C11126BB;
 Thu,  9 Jun 2022 12:57:05 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7B10021F24;
 Thu,  9 Jun 2022 12:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1654779424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U28j2PjZN2oiqvKxhUnwyd/bN75hpBsh2AgbH09Uz7A=;
 b=cFkohmjy7k4OX9d1OaQPtTN9EE/zJV2ErpgiPH7m8blNWJJ6BBZeoEmEz449KI0rfzy2BA
 XVeJQYaCgUF2mN2YG6+08pn+iSIHSyBrXQeAga+1sko3yRfSLWaHAiur5hWq9muNl5oJnw
 q766pmidjn9XorGZeH2GHV38FRhBu+g=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3EEAD2C141;
 Thu,  9 Jun 2022 12:57:04 +0000 (UTC)
Date: Thu, 9 Jun 2022 14:57:03 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
References: <20220531100007.174649-1-christian.koenig@amd.com>
 <20220531100007.174649-4-christian.koenig@amd.com>
 <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linux-tegra@vger.kernel.org, alexander.deucher@amd.com,
 akpm@linux-foundation.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu 09-06-22 14:16:56, Christian König wrote:
> Am 09.06.22 um 11:18 schrieb Michal Hocko:
> > On Tue 31-05-22 11:59:57, Christian König wrote:
> > > This gives the OOM killer an additional hint which processes are
> > > referencing shmem files with potentially no other accounting for them.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > ---
> > >   mm/shmem.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/mm/shmem.c b/mm/shmem.c
> > > index 4b2fea33158e..a4ad92a16968 100644
> > > --- a/mm/shmem.c
> > > +++ b/mm/shmem.c
> > > @@ -2179,6 +2179,11 @@ unsigned long shmem_get_unmapped_area(struct file *file,
> > >   	return inflated_addr;
> > >   }
> > > +static long shmem_oom_badness(struct file *file)
> > > +{
> > > +	return i_size_read(file_inode(file)) >> PAGE_SHIFT;
> > > +}
> > This doesn't really represent the in memory size of the file, does it?
> 
> Well the file could be partially or fully swapped out as anonymous memory or
> the address space only sparse populated, but even then just using the file
> size as OOM badness sounded like the most straightforward approach to me.

It covers hole as well, right?

> What could happen is that the file is also mmaped and we double account.
> 
> > Also the memcg oom handling could be considerably skewed if the file was
> > shared between more memcgs.
> 
> Yes, and that's one of the reasons why I didn't touched the memcg by this
> and only affected the classic OOM killer.

oom_badness is for all oom handlers, including memcg. Maybe I have
misread an earlier patch but I do not see anything specific to global
oom handling.

-- 
Michal Hocko
SUSE Labs
