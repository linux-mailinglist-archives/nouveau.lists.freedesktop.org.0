Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B95464E7
	for <lists+nouveau@lfdr.de>; Fri, 10 Jun 2022 12:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983F910E86F;
	Fri, 10 Jun 2022 10:58:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6272C10E86F;
 Fri, 10 Jun 2022 10:58:58 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x62so34758335ede.10;
 Fri, 10 Jun 2022 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=w6F5upqNbqcjOOBJM+5BezuuZ8DymaMUCrQuFA3GOnA=;
 b=YZZv8NAd4bFAUuTNFuwIlDcmKTp86LFMvcog24DagojMbNLE5Se1DmFMVmJ87uRvVn
 DHg3DsyZl5P8aCUmB2QRs6OBqSILElVCVRD7bc68R64iLg9kYb342KPpCwWXWO184NBc
 HQcHyAdUhV8Q0WhynDc+yQ4/sZ7PQcZevq6VBL5SzqV6KYGeklmIRe38n9bvYY5Q1+JK
 WhZSTnmlqR3Jo6PN7avr1sSEwFMtRIB63k6sjGq6yDCPtUFoSFNusdQKAtNJh/AlfSLS
 +4BnHWFH5oLHuBp1MpFR5IFuUXStqITHPSeYQd5mB00paW4tZfj70WmiPHpMoU2dylt+
 VQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w6F5upqNbqcjOOBJM+5BezuuZ8DymaMUCrQuFA3GOnA=;
 b=7bOfUFrFeizVZi30wtKzZY4mH8PFMwYTPt9Iw7130nE8iYByq30hViRMiy2nlXo5Br
 OlBCxDy/ZOWWdJQfiusVc926Cb6OaCv54Z/nHs+TZzLx8cUNdG3hmDZj9L8L7iTXWIQn
 ZIZ3MmAAqO8+DUbl0magq277py1LDYdnAht2uyIXi5mgNRKLO0Zo2UpN1h+fEqsZlMsl
 nSi4Fgl0p80gpo7qq+k5d1upH9f3a7aJn46+ZxMat2FMDUmKIujHEvScPaZ2Pe5cUKZM
 d6QZz0SaZxnfCCKXm7nMIHj11UWMVMO1vdthzDTRRbqVc5NNVmlRsKaWtiw83I75xFvf
 4vQQ==
X-Gm-Message-State: AOAM5325rKkLokmtiwCLhUS3k812CSyxsA7BHRQ1ZFNux0aZ5Kqrf/0s
 GIz8PVhKYzAwrBSrEFtUBb8uSI4NaHHJTw==
X-Google-Smtp-Source: ABdhPJwRYA/7eDJK0xNPvbtH+OzO5lQ4tB0JbSJQSmwOmyloSbsX0o7RtK6TGGmCWnVQA/XG1FkVRA==
X-Received: by 2002:a05:6402:368a:b0:42d:ef42:f727 with SMTP id
 ej10-20020a056402368a00b0042def42f727mr50676107edb.204.1654858736837; 
 Fri, 10 Jun 2022 03:58:56 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 fi20-20020a1709073ad400b006fec8e8eff6sm12055062ejc.176.2022.06.10.03.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 03:58:55 -0700 (PDT)
Message-ID: <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
Date: Fri, 10 Jun 2022 12:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
 <20220531100007.174649-4-christian.koenig@amd.com>
 <YqG67sox6L64E6wV@dhcp22.suse.cz>
 <77b99722-fc13-e5c5-c9be-7d4f3830859c@amd.com>
 <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
 <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
 <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
 <YqIMmK18mb/+s5de@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YqIMmK18mb/+s5de@dhcp22.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 akpm@linux-foundation.org, linux-media@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Am 09.06.22 um 17:07 schrieb Michal Hocko:
> On Thu 09-06-22 16:29:46, Christian König wrote:
> [...]
>> Is that a show stopper? How should we address this?
> This is a hard problem to deal with and I am not sure this simple
> solution is really a good fit. Not only because of the memcg side of
> things. I have my doubts that sparse files handling is ok as well.

Well I didn't claimed that this would be easy, we juts need to start 
somewhere.

Regarding the sparse file handling, how about using 
file->f_mapping->nrpages as badness for shmem files?

That should give us the real number of pages allocated through this 
shmem file and gracefully handles sparse files.

> I do realize this is a long term problem and there is a demand for some
> solution at least. I am not sure how to deal with shared resources
> myself. The best approximation I can come up with is to limit the scope
> of the damage into a memcg context. One idea I was playing with (but
> never convinced myself it is really a worth) is to allow a new mode of
> the oom victim selection for the global oom event. It would be an opt in
> and the victim would be selected from the biggest leaf memcg (or kill
> the whole memcg if it has group_oom configured.
>
> That would address at least some of the accounting issue because charges
> are better tracked than per process memory consumption. It is a crude
> and ugly hack and it doesn't solve the underlying problem as shared
> resources are not guaranteed to be freed when processes die but maybe it
> would be just slightly better than the existing scheme which is clearly
> lacking behind existing userspace.

Well, what is so bad at the approach of giving each process holding a 
reference to some shared memory it's equal amount of badness even when 
the processes belong to different memory control groups?

If you really think that this would be a hard problem for upstreaming we 
could as well keep the behavior for memcg as it is for now. We would 
just need to adjust the paramters to oom_badness() a bit.

Regards,
Christian.
