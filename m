Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E0958A221
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D76BA6F4B;
	Thu,  4 Aug 2022 20:37:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2130610E8BD;
 Wed, 15 Jun 2022 13:15:26 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BF13A21BB9;
 Wed, 15 Jun 2022 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1655298924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17VEqNPV/TBk73G7tKfWD0AkIggznFYMqcz7zsD4S9c=;
 b=c5CplPzuxQh5gnp4bD34uWkKLEOaOc1Tpwslt5ARBi5fVdHjWZ4prxmWoQqcdCpqAG1Yor
 xmQuGVnUEOpCEt1XYqn7LUtFrFvMKUMl0YDT2F/jRq/vq+FW+bBxji/zHIwKJ8jaI2QMZs
 rqLOKCpvqZTZhxAjHRYVGQZVY5XNs10=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 66BBD2C141;
 Wed, 15 Jun 2022 13:15:24 +0000 (UTC)
Date: Wed, 15 Jun 2022 15:15:23 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <Yqnba1E2FSRVUATY@dhcp22.suse.cz>
References: <YqMuq/ZrV8loC3jE@dhcp22.suse.cz>
 <2e7e050e-04eb-0c0a-0675-d7f1c3ae7aed@amd.com>
 <YqNSSFQELx/LeEHR@dhcp22.suse.cz>
 <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
 <Yqbq/Q5jz2ou87Jx@dhcp22.suse.cz>
 <b8b9aba5-575e-8a34-e627-79bef4ed7f97@amd.com>
 <YqcpZY3Xx7Mk2ROH@dhcp22.suse.cz>
 <34daa8ab-a9f4-8f7b-0ea7-821bc36b9497@gmail.com>
 <YqdFkfLVFUD5K6EK@dhcp22.suse.cz>
 <9e170201-35df-cfcc-8d07-2f9693278829@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e170201-35df-cfcc-8d07-2f9693278829@amd.com>
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:34:57 +0000
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

On Wed 15-06-22 14:35:22, Christian König wrote:
[...]
> Even the classic mm_struct based accounting includes MM_SHMEMPAGES into the
> badness. So accounting shared resources as badness to make a decision is
> nothing new here.

Yeah, it is nothing really new but it also doesn't mean it is an example
worth following as this doesn't really work currently. Also please note
that MM_SHMEMPAGES is counting at least something process specific as
those pages are mapped in to the process (and with enough of wishful
thinking unmapping can drop the last reference and free something up
actually) . With generic per-file memory this is even more detached from
process.

> The difference is that this time the badness doesn't come from the memory
> management subsystem, but rather from the I/O subsystem.
> 
> > This is also the reason why I am not really fan of the per file
> > badness because it adds a notion of resource that is not process bound
> > in general so it will add all sorts of weird runtime corner cases which
> > are impossible to anticipate [*]. Maybe that will work in some scenarios
> > but definitely not something to be done by default without users opting
> > into that and being aware of consequences.
> 
> Would a kernel command line option to control the behavior be helpful here?

I am not sure what would be the proper way to control that that would be
future extensible. Kernel command line is certainly and option but if we
want to extend that to module like or eBPF interface then it wouldn't
stand a future test very quickly.

-- 
Michal Hocko
SUSE Labs
