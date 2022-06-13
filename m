Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D52F1548553
	for <lists+nouveau@lfdr.de>; Mon, 13 Jun 2022 14:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405B10E4B2;
	Mon, 13 Jun 2022 12:55:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5C810E13E;
 Mon, 13 Jun 2022 12:55:58 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g7so7023911eda.3;
 Mon, 13 Jun 2022 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eTQgrOtNKXeuE24E4z1BZTvFXtuq4jZXbc2fnCBYhC4=;
 b=Nj4MPAUCb8OsNfEZnsGGbUCGhFTknfSsE2F2y/SD3ys8pENJtRCBqv0QGE5MeJqZKf
 4ujqAiYBhiFAQIIMPaygZHU0/g+3YknfQZZNi4Zk1JY22jEvvgIxbsyGHQl/L5VMCTv+
 PhibmZ6Q8zOwiyhaUUxlLced1et9/+osLVbICikxeqZICFXFHZtDonOd+BrKN251SWnv
 dxbwERu7dgYthvRMX8FfmxERfODU787Zqp6sW7mpxaFLu2txINVkCxHxdrUWAlAktt3B
 5jBGTrYKi//rCcqiMtbP1tfziE+slRshLlGSrrgWkutmG5+D2MFut4UwQ9MF72FkL5M7
 IRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eTQgrOtNKXeuE24E4z1BZTvFXtuq4jZXbc2fnCBYhC4=;
 b=EXR+QT8EY1kFSIAdtVaCWXYDCQ0ByJ4Nz1Eutvw8c9y/XRYogrWtPpQ4JMkhfjBKx/
 Kkzbst5K9E42UwLk7bmr9bV6Odm+W2jRYH+QuRq/iy9zBJNO7yddk4xQO4BP4RsCmEZF
 ozCJd8A7S1NDd6r7hANzoa8gggDh2tJMlW22gvZc3bIKzWPZFJLcKsV3h1895s3hHAis
 nnBBf8FySER3xoYq644TwWvLdswUBBQUswgvqgagAI69wA7A7uNTc4x46uVAkpvd0G00
 jlka6ajSDtnmJYWAg3JrmbuARVr+6BrP57fr0DEVsfo1OzUxYVXoJfM4EjZFc46Wkb0L
 itTQ==
X-Gm-Message-State: AOAM530nHDdLpn3hFdRSex8eq0Y283PZCHNgkq52RlijpExVtd1QJPKr
 MjCrHacGumeayN4W4w43K7b2Vk5Wfa0=
X-Google-Smtp-Source: ABdhPJyT0uwBN5ukf/MuNShwizt1LoZp0+Oby2zBTUXp3fSO81I8QLT2dBcsK6cZgTnu+DBQ4P/AYA==
X-Received: by 2002:a05:6402:1e92:b0:42d:dc34:e233 with SMTP id
 f18-20020a0564021e9200b0042ddc34e233mr65598749edf.386.1655124957390; 
 Mon, 13 Jun 2022 05:55:57 -0700 (PDT)
Received: from [192.168.178.21] (p57b0b659.dip0.t-ipconnect.de.
 [87.176.182.89]) by smtp.gmail.com with ESMTPSA id
 v20-20020a1709060b5400b0070662b3b792sm3765548ejg.222.2022.06.13.05.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 05:55:56 -0700 (PDT)
Message-ID: <34daa8ab-a9f4-8f7b-0ea7-821bc36b9497@gmail.com>
Date: Mon, 13 Jun 2022 14:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <YqIB0bavUeU8Abwl@dhcp22.suse.cz>
 <d4a19481-7a9f-19bf-c270-d89baa0970fc@amd.com>
 <YqIMmK18mb/+s5de@dhcp22.suse.cz>
 <3f7d3d96-0858-fb6d-07a3-4c18964f888e@gmail.com>
 <YqMuq/ZrV8loC3jE@dhcp22.suse.cz>
 <2e7e050e-04eb-0c0a-0675-d7f1c3ae7aed@amd.com>
 <YqNSSFQELx/LeEHR@dhcp22.suse.cz>
 <288528c3-411e-fb25-2f08-92d4bb9f1f13@gmail.com>
 <Yqbq/Q5jz2ou87Jx@dhcp22.suse.cz>
 <b8b9aba5-575e-8a34-e627-79bef4ed7f97@amd.com>
 <YqcpZY3Xx7Mk2ROH@dhcp22.suse.cz>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YqcpZY3Xx7Mk2ROH@dhcp22.suse.cz>
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

Am 13.06.22 um 14:11 schrieb Michal Hocko:
> [SNIP]
>>>> Alternative I could try to track the "owner" of a buffer (e.g. a shmem
>>>> file), but then it can happen that one processes creates the object and
>>>> another one is writing to it and actually allocating the memory.
>>> If you can enforce that the owner is really responsible for the
>>> allocation then all should be fine. That would require MAP_POPULATE like
>>> semantic and I suspect this is not really feasible with the existing
>>> userspace. It would be certainly hard to enforce for bad players.
>> I've tried this today and the result was: "BUG: Bad rss-counter state
>> mm:000000008751d9ff type:MM_FILEPAGES val:-571286".
>>
>> The problem is once more that files are not informed when the process
>> clones. So what happened is that somebody called fork() with an mm_struct
>> I've accounted my pages to. The result is just that we messed up the
>> rss_stats and  the the "BUG..." above.
>>
>> The key difference between normal allocated pages and the resources here is
>> just that we are not bound to an mm_struct in any way.
> It is not really clear to me what exactly you have tried.

I've tried to track the "owner" of a driver connection by keeping a 
reference to the mm_struct who created this connection inside our file 
private and then use add_mm_counter() to account all the allocations of 
the driver to this mm_struct.

This works to the extend that now the right process is killed in an OOM 
situation. The problem with this approach is that the driver is not 
informed about operations like fork() or clone(), so what happens is 
that after a fork()/clone() we have an unbalanced rss-counter.

Let me maybe get back to the initial question: We have resources which 
are not related to the virtual address space of a process, how should we 
tell the OOM killer about them?

Thanks for all the input so far,
Christian.
