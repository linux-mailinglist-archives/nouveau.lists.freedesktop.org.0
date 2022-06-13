Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B458A204
	for <lists+nouveau@lfdr.de>; Thu,  4 Aug 2022 22:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E832A6F42;
	Thu,  4 Aug 2022 20:37:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jun 2022 09:14:45 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [IPv6:2001:67c:2050:0:465::201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C704A10E0EC;
 Mon, 13 Jun 2022 09:14:45 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4LM5N73Srsz9sZR;
 Mon, 13 Jun 2022 11:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1655111335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/diBHTT7FJGtxv9Ix4yOBCZ8RnU/aeUMZMRq1jZWVd0=;
 b=Znxifht26gApX39S8dBdMlCkItNVWLXnXVPMEVWY3AG9zAT6gRrWMY9rhTZyANLJTCXA+T
 /Py+ybJGqRWT/5GkeLRhJZiWzDalGM3ZvZadEpQEYyYCU21C9ACURqw1LrNyUVHsOxWjvx
 1p9izA8OmzrQ5cxuRmCiyhEfNhVce3b+LqtSrMJHG1exvU+qFVCJb9AZGKmxkawe7s4w+F
 /Xrajo+QQRwLwU5ACiJOqV5anBx0ps2Y2wIrqp32YeXJCOeBwJm20EiuG6GVGM12Bl5Dy4
 ebLpFyJ47wP6J1/GG07XltI+NvUdJKpT2sZ8ndEXg24vYNlBTBRianCdqohCbA==
Message-ID: <51536e97-ca5f-abe4-b46c-ee3eb57f891e@mailbox.org>
Date: Mon, 13 Jun 2022 11:08:52 +0200
MIME-Version: 1.0
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Michal Hocko <mhocko@suse.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
 <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
 <YqIMmK18mb/+s5de@dhcp22.suse.cz>
 <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
 <YqMuq/ZrV8loC3jE@dhcp22.suse.cz>
 <2e7e050e-04eb-0c0a-0675-d7f1c3ae7aed@amd.com>
 <YqNSSFQELx/LeEHR@dhcp22.suse.cz>
 <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 577iphbxb4bs3945taqe58kkqzbs8imi
X-MBO-RS-ID: 72e59480f2d70ddaf00
X-Rspamd-Queue-Id: 4LM5N73Srsz9sZR
X-Mailman-Approved-At: Thu, 04 Aug 2022 20:35:18 +0000
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
Cc: andrey.grodzovsky@amd.com, linux-tegra@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 hughd@google.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, viro@zeniv.linux.org.uk, daniel@ffwll.ch,
 linux-fsdevel@vger.kernel.org, alexander.deucher@amd.com,
 akpm@linux-foundation.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2022-06-11 10:06, Christian König wrote:
> Am 10.06.22 um 16:16 schrieb Michal Hocko:
>> [...]
>>>> Just consider the above mentioned memcg driven model. It doesn't really
>>>> require to chase specific files and do some arbitrary math to share the
>>>> responsibility. It has a clear accounting and responsibility model.
>>> Ok, how does that work then?
>> The memory is accounted to whoever faults that memory in or to the
>> allocating context if that is a kernel memory (in most situations).
> 
> That's what I had in mind as well. Problem with this approach is that file descriptors are currently not informed that they are shared between processes.
> 
> So to make this work we would need something like attach/detach to process in struct file_operations.
> 
> And as I noted, this happens rather often. For example a game which renders 120 frames per second needs to transfer 120 buffers per second between client and X.

FWIW, in the steady state, the game will cycle between a small (generally 2-5) set of buffers. The game will not cause new buffers to be exported & imported for every frame.

In general, I'd expect dma-buf export & import to happen relatively rarely, e.g. when a window is opened or resized.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
