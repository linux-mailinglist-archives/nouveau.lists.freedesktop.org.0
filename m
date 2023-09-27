Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4577B0349
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 13:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1410E4E5;
	Wed, 27 Sep 2023 11:45:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016B10E4E5
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695815142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvsPqdWL7XgWKeKWvC9F1HtbY+HpBNK3bs0TVz67ajA=;
 b=OMlKqdQi2jaRH2jeJPPuI4qslNen/zEYE32ku8Qgqt7U4qDmEd7vB0IoXJIrXsliC0wcfu
 vB4wiwIz9RVqjwuiX6fn5yIvTwoDSbz36hbxsyxI1uW9RL5h2z9fErfuMQnlCA9MBIKnBJ
 Qsbgx4mVFEKJShSIasWFUTa+DitmedM=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-81IXmaC6Py2079WM6sY-uA-1; Wed, 27 Sep 2023 07:45:40 -0400
X-MC-Unique: 81IXmaC6Py2079WM6sY-uA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c0165b5c5cso156714341fa.1
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 04:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695815139; x=1696419939;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nvsPqdWL7XgWKeKWvC9F1HtbY+HpBNK3bs0TVz67ajA=;
 b=qbMFootssVjqu9TSrjYBFbCBwBWpIqml5IwmKuhiIyogPxoneqzoMIgz9iJQlWXwP1
 rz2LmlUSz5CsA5hqiQ5R3UEFosS7eSKyvawbMU+E0LuAf7kxqiCfqAZerG+dwbdrLo5O
 WRtmgk7Pqit5HQ1CMiHeMhIDFIl6TgHKuDvgWMlf3/peo0q6Y7f1fvlGv3/MjW7Jvn55
 CCConnWzL899iXm0qSHf5R5SUXwunjWLjsMhtFFjIjGsR4oOvEWc5WjB6K/BWa3na5rp
 0pjWCcAR1IBa/iQTeR5vUl65wDSQE2F7gy08BHTc/GBw8GCOFFTymL+yaV+5psP+kvZY
 MTsg==
X-Gm-Message-State: AOJu0YyviGADlqgYdpA4XZJb6dsY1tv6WOYQ3TKP97KkZKvWhjqVVA8j
 OAS+oC4nNaedgSyTu7IWr0jtOTySa9DBETd7P4EExK+dcJWOVEweesAVYxmZUteueVHZE2ISVgU
 a6kCvYLpnRRgdSHyCZ5JQbWXvKg==
X-Received: by 2002:a05:6512:1287:b0:503:183c:1223 with SMTP id
 u7-20020a056512128700b00503183c1223mr2243232lfs.7.1695815139379; 
 Wed, 27 Sep 2023 04:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMxjIWznnDjMe6Hk6VxuIsyF02/jJ80hi8lUi5oaXw4lt20x5rKCPRe8RS/GUfXlNVDxbElQ==
X-Received: by 2002:a05:6512:1287:b0:503:183c:1223 with SMTP id
 u7-20020a056512128700b00503183c1223mr2243209lfs.7.1695815139037; 
 Wed, 27 Sep 2023 04:45:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a056402054d00b0052a063e52b8sm7930477edx.83.2023.09.27.04.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 04:45:38 -0700 (PDT)
Message-ID: <a050bc34-d98e-3d75-8c79-447dc7c913a1@redhat.com>
Date: Wed, 27 Sep 2023 13:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <312983ee-ba4c-477e-8846-072c815df862@amd.com>
 <12f19494-7fd0-055f-4135-e17581398eb5@redhat.com>
 <20230927092514.04776822@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230927092514.04776822@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH drm-misc-next 1/3] drm/sched: implement
 dynamic job flow control
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
Cc: matthew.brost@intel.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, daniel@ffwll.ch, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/27/23 09:25, Boris Brezillon wrote:
> On Wed, 27 Sep 2023 02:13:59 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> On 9/26/23 22:43, Luben Tuikov wrote:
>>> Hi,
>>>
>>> On 2023-09-24 18:43, Danilo Krummrich wrote:
>>>> Currently, job flow control is implemented simply by limiting the amount
>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>> submission limit that corresponds to a certain amount of jobs.
>>>
>>> "certain"? How about this instead:
>>> " ... that corresponds to the number of jobs which can be sent
>>>     to the hardware."?
>>>    
>>>>
>>>> This implies that for each job drivers need to account for the maximum
>>>                                   ^,
>>> Please add a comma after "job".
>>>    
>>>> job size possible in order to not overflow the ring buffer.
>>>
>>> Well, different hardware designs would implement this differently.
>>> Ideally, you only want pointers into the ring buffer, and then
>>> the hardware consumes as much as it can. But this is a moot point
>>> and it's always a good idea to have a "job size" hint from the client.
>>> So this is a good patch.
>>>
>>> Ideally, you want to say that the hardware needs to be able to
>>> accommodate the number of jobs which can fit in the hardware
>>> queue times the largest job. This is a waste of resources
>>> however, and it is better to give a hint as to the size of a job,
>>> by the client. If the hardware can peek and understand dependencies,
>>> on top of knowing the "size of the job", it can be an extremely
>>> efficient scheduler.
>>>    
>>>>
>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>> rather large range. For such drivers it can easily happen that job
>>>> submissions not even filling the ring by 1% can block subsequent
>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>
>>>> In order to overcome this issue, allow for tracking the actual job size
>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>
>>> "the amount job jobs." --> "the number of jobs."
>>
>> Yeah, I somehow manage to always get this wrong, which I guess you noticed
>> below already.
>>
>> That's all good points below - gonna address them.
>>
>> Did you see Boris' response regarding a separate callback in order to fetch
>> the job's submission units dynamically? Since this is needed by PowerVR, I'd
>> like to include this in V2. What's your take on that?
>>
>> My only concern with that would be that if I got what Boris was saying
>> correctly calling
>>
>> WARN_ON(s_job->submission_units > sched->submission_limit);
>>
>> from drm_sched_can_queue() wouldn't work anymore, since this could indeed happen
>> temporarily. I think this was also Christian's concern.
> 
> Actually, I think that's fine to account for the max job size in the
> first check, we're unlikely to have so many native fence waits that our
> job can't fit in an empty ring buffer.
> 

But it can happen, right? Hence, we can't have this check, do we?

