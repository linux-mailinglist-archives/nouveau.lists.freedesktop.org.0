Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C19058A209
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F286AA6F6B;
	Thu,  4 Aug 2022 20:37:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB0F12AD18;
 Thu,  9 Jun 2022 15:07:06 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 94DBF1FE1A;
 Thu,  9 Jun 2022 15:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1654787225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ijNQJtk6i4bS4QWxJisxGyfX37F5AKbQDFufqaSXZY=;
 b=r0GH8a8OMYz9qCxwYnlpQdqJcDdzr81y+7Q96zHtHvv7mOhAiBSBx5z5skJYQuheM9fyrP
 OhwVH796ac6EGIP82Wqxy84XKU2xF2Fw406nnsVzRyzdtn3sZ8tyeYubU4helxrxefY3Ms
 g4pszhJLgKRiq4sTvLytSaOCon18h8E=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 4A85F2C141;
 Thu,  9 Jun 2022 15:07:05 +0000 (UTC)
Date: Thu, 9 Jun 2022 17:07:04 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YqIMmK18mb/+s5de@dhcp22.suse.cz>
References: <20220531100007.174649-1-christian.koenig@amd.com>
 <20220531100007.174649-4-christian.koenig@amd.com>
 <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
 <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
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

On Thu 09-06-22 16:29:46, Christian König wrote:
[...]
> Is that a show stopper? How should we address this?

This is a hard problem to deal with and I am not sure this simple
solution is really a good fit. Not only because of the memcg side of
things. I have my doubts that sparse files handling is ok as well.

I do realize this is a long term problem and there is a demand for some
solution at least. I am not sure how to deal with shared resources
myself. The best approximation I can come up with is to limit the scope
of the damage into a memcg context. One idea I was playing with (but
never convinced myself it is really a worth) is to allow a new mode of
the oom victim selection for the global oom event. It would be an opt in
and the victim would be selected from the biggest leaf memcg (or kill
the whole memcg if it has group_oom configured.

That would address at least some of the accounting issue because charges
are better tracked than per process memory consumption. It is a crude
and ugly hack and it doesn't solve the underlying problem as shared
resources are not guaranteed to be freed when processes die but maybe it
would be just slightly better than the existing scheme which is clearly
lacking behind existing userspace.
-- 
Michal Hocko
SUSE Labs
