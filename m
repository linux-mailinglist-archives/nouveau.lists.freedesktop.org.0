Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A1258A22C
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40981A6F86;
	Thu,  4 Aug 2022 20:37:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB33811A84D;
 Thu,  9 Jun 2022 15:54:09 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 5FDBB1FEA9;
 Thu,  9 Jun 2022 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1654790048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZtcZUbZig1UhIcXMJ758dp36LQQ/d16e8zqnLoYBUI=;
 b=WeDq7XZhXURQuDayn95bRWP62X8BWXvBWugF0x6+pE4jsWM4S9ZNndFwfvt1GcJxeIMrCZ
 sg5yXPKNGFmFwwTy5w1f5UsEiyFE3HKe7evhJUnwKy37LUQ9n6BAxBciF4GE87AHj9LJ0Q
 KzeXJveNtrfE/koMZPau6VmuysgUvhM=
Received: from suse.cz (unknown [10.100.201.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 090D02C141;
 Thu,  9 Jun 2022 15:54:07 +0000 (UTC)
Date: Thu, 9 Jun 2022 17:54:07 +0200
From: Michal Hocko <mhocko@suse.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Message-ID: <YqIXn0V3dEvGPZ1h@dhcp22.suse.cz>
References: <20220531100007.174649-1-christian.koenig@amd.com>
 <20220531100007.174649-4-christian.koenig@amd.com>
 <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
 <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d841c1ab-c0d1-5130-11fc-c8ea04cc9511@amd.com>
 <41dc3e5a-9e90-70df-74df-ccdf8fa5ae86@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41dc3e5a-9e90-70df-74df-ccdf8fa5ae86@amd.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, hughd@google.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu 09-06-22 17:22:14, Christian König wrote:
[...]
> Those files were never part of any filesystem in the first place, so by
> killing all the process referencing them you can indeed free the memory
> locked by them.

Yes, this would require the oom killer to understand that all processes
referencing that file are killed. Theoretically possible but I am not
sure a feasible solution.
-- 
Michal Hocko
SUSE Labs
