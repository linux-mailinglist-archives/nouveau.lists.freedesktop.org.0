Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91573544E6A
	for <lists+nouveau@lfdr.de>; Thu,  9 Jun 2022 16:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6214312A8AD;
	Thu,  9 Jun 2022 14:10:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E5712A8A8;
 Thu,  9 Jun 2022 14:10:48 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x62so31368037ede.10;
 Thu, 09 Jun 2022 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mEtsDMb1k6CAhwW7ISC2TInxkibSNypnKownS0OQOzM=;
 b=mgrJ9hp/GfgwWN5tXJmnl8BnnEqXCAKpNGpam7MtrpYO0SI1hQovYwM1cGtHRSBW8N
 8hwdKmACCRbdEVp3ztBxuOUpU8Lj8cWf+Kx+Z+HJz+f/NStxBiUuk3lNwo/iQqflxvTF
 InhPQenYDtubdWj0kzqQunKVK2VpuXe5lG3LqH359TPGOV1ya8aUubNqeEJm5slFN9UC
 s0l6wKpJdTKH6VEkOyvnAWu4FuxiRHTd1mmSc0t20a63BtaAauk73vDVGuMPaKxjSfDI
 ZF7BlODVAXy32IB8sffpp41YjC1ufolYJTK/mIyUwM1Gg4I4h8Te99MpvvqM5hnlFIwa
 jqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mEtsDMb1k6CAhwW7ISC2TInxkibSNypnKownS0OQOzM=;
 b=n+gRoRc8rmI/BDoJoxDYcA6EIYhkrTrRcmHcOig2LeH5lLLs5pWNqFAfQxo+dz10WQ
 R06Gg71jlYkPhF/lJshGgqZPNDM78/UYPX9HZgGkaH5WVfabsG6//lszdEmNVqZGrFOq
 44xS/OgAtMuaOFgvKE+rOqejUynEQnhNV3dv7/rvrO6i8heVhhx6PnhUjeJbpkbYYJ8m
 Pku9YgZZTiOEXy9S6dOyWtNm8c6szi5yV0dlIM5E5dxiXQSHuqDn5CaDjJQJGRoNS1u3
 lEFt8o9477oKhQ8XQJfLL5iTuYoe4OLC3YxfFDUNTNqyZymK7frVHzEOssmhuRLMa+7J
 uWAg==
X-Gm-Message-State: AOAM531mQ1KNjN/Lv7OvkNoGpTfuChZqNHfyz3LyISRwtYY+6DH6ovig
 caCsrTt+8mZvpqVsIG3gSsA=
X-Google-Smtp-Source: ABdhPJyeKHQqi9/0tzt/2RVsH3TlW5RXc5Nbx2kxhyDYn4Th+HmG5UQ3rIQ0Tdhh57D5z0Br/W8sFA==
X-Received: by 2002:a05:6402:3291:b0:42d:dd03:cbb1 with SMTP id
 f17-20020a056402329100b0042ddd03cbb1mr44742813eda.268.1654783846479; 
 Thu, 09 Jun 2022 07:10:46 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:99ff:907d:6fef:f861?
 ([2a02:908:1256:79a0:99ff:907d:6fef:f861])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa7d458000000b0042aad9edc9bsm14778769edr.71.2022.06.09.07.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:10:39 -0700 (PDT)
Message-ID: <26d3e1c7-d73c-cc95-54ef-58b2c9055f0c@gmail.com>
Date: Thu, 9 Jun 2022 16:10:33 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YqHuH5brYFQUfW8l@dhcp22.suse.cz>
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

Am 09.06.22 um 14:57 schrieb Michal Hocko:
> On Thu 09-06-22 14:16:56, Christian König wrote:
>> Am 09.06.22 um 11:18 schrieb Michal Hocko:
>>> On Tue 31-05-22 11:59:57, Christian König wrote:
>>>> This gives the OOM killer an additional hint which processes are
>>>> referencing shmem files with potentially no other accounting for them.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    mm/shmem.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/mm/shmem.c b/mm/shmem.c
>>>> index 4b2fea33158e..a4ad92a16968 100644
>>>> --- a/mm/shmem.c
>>>> +++ b/mm/shmem.c
>>>> @@ -2179,6 +2179,11 @@ unsigned long shmem_get_unmapped_area(struct file *file,
>>>>    	return inflated_addr;
>>>>    }
>>>> +static long shmem_oom_badness(struct file *file)
>>>> +{
>>>> +	return i_size_read(file_inode(file)) >> PAGE_SHIFT;
>>>> +}
>>> This doesn't really represent the in memory size of the file, does it?
>> Well the file could be partially or fully swapped out as anonymous memory or
>> the address space only sparse populated, but even then just using the file
>> size as OOM badness sounded like the most straightforward approach to me.
> It covers hole as well, right?

Yes, exactly.

>
>> What could happen is that the file is also mmaped and we double account.
>>
>>> Also the memcg oom handling could be considerably skewed if the file was
>>> shared between more memcgs.
>> Yes, and that's one of the reasons why I didn't touched the memcg by this
>> and only affected the classic OOM killer.
> oom_badness is for all oom handlers, including memcg. Maybe I have
> misread an earlier patch but I do not see anything specific to global
> oom handling.

As far as I can see the oom_badness() function is only used in oom_kill.c and in procfs to return the oom score. Did I missed something?

Regards,
Christian.
