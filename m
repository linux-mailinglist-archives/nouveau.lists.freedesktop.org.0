Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C67B064B
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 16:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F089810E53E;
	Wed, 27 Sep 2023 14:12:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26E10E53D
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 14:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695823938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TS50nfKIBaR2f2dSDoZp+DMR8sQ+Npn+3rAuOaAUqa8=;
 b=QRyVX3PGb3LPGAN1s24/nlZxUoeNORlVfGwsM6l85aHYz5DaUTmhMUQuf59qfQwRwZDSTZ
 F0sUaFWxXrc+qlM2G+4jdaSrW8BDzPPgM/qhoCJsPb6nXB1RCd1VtSUxjO2zhGmHQf6lHS
 CaAGNbEJm8XDGCtor6UcmQ0+yxzGNn4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-lk5k8WSVNMW0ti2-0KNiFA-1; Wed, 27 Sep 2023 10:12:17 -0400
X-MC-Unique: lk5k8WSVNMW0ti2-0KNiFA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ae70250ef5so2036726666b.0
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 07:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695823936; x=1696428736;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TS50nfKIBaR2f2dSDoZp+DMR8sQ+Npn+3rAuOaAUqa8=;
 b=rgNLrj6UCFmB+CtnHqARX38wbWqsZGjGziqqWni5lCWv8c6WcKjYqqqRV6kpNgKxVx
 Rxdvg9kEfSnS9NmZn2OR2n1zDEuc4loYJuebo0vToGQ+sLK3fQRW/S1GYsPCDeDIrelP
 kSjPe2Sm5ZU0OsA1o6YUsjYULhp2FUwrLaBFZeJ6JQfmPfpvPBSdEA7Ki1qd4iFzA7FO
 mCvfSYmEZsh22Sx/uFppCF8+6zgrUx1Nc88oZXC0mARbcM3sl1xiKD4JU+2z85kGvSkX
 uia11Mrr9MkZLDo+iA+zIhEV8ZnUT79I/3vlSRlrwWNB6lCvLRbSgXiD5qCz3HN4nQr2
 SRzQ==
X-Gm-Message-State: AOJu0Yx/nM0UEZ1SSwEO7wfW7NlUpgHjiRLIz9/UcdUAuFA87qnDFaBg
 /qt6o1/9rWZc5Bq2Bz9kLdC12grL44QfS8K6Ao5B7NHJmLR8LDUfKreOs1xOzB2c2+M0AYx6QtN
 /P1kqAzxiRw1NXQ2IvBFJ/w5m8Q==
X-Received: by 2002:a17:907:7d9e:b0:9ad:8a96:ad55 with SMTP id
 oz30-20020a1709077d9e00b009ad8a96ad55mr9687745ejc.14.1695823936332; 
 Wed, 27 Sep 2023 07:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+tXonBKUNQm8m4jKtfW46a6X0837VoxYwhrGBP+FM0SJ3GTyzC1VNUjMqE+LvFB0CU9+EsA==
X-Received: by 2002:a17:907:7d9e:b0:9ad:8a96:ad55 with SMTP id
 oz30-20020a1709077d9e00b009ad8a96ad55mr9687703ejc.14.1695823935966; 
 Wed, 27 Sep 2023 07:12:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 qq23-20020a17090720d700b00993664a9987sm9329969ejb.103.2023.09.27.07.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 07:12:15 -0700 (PDT)
Message-ID: <b4dee044-56e6-39f5-17c5-8d2c52e752ad@redhat.com>
Date: Wed, 27 Sep 2023 16:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
 <5c6e1348-ec38-62b1-a056-1b7a724d99eb@redhat.com>
 <1f113c7b-975e-c72f-e6f0-ded55d10d64f@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1f113c7b-975e-c72f-e6f0-ded55d10d64f@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, Frank Binns <Frank.Binns@imgtec.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, Donald Robson <Donald.Robson@imgtec.com>,
 daniel@ffwll.ch, faith.ekstrand@collabora.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/27/23 14:15, Christian König wrote:
> Am 27.09.23 um 14:11 schrieb Danilo Krummrich:
>> On 9/27/23 13:54, Christian König wrote:
>>> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
>>>> On Mon, 25 Sep 2023 19:55:21 +0200
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>
>>>>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:
>>>>>> +The imagination team, who's probably interested too.
>>>>>>
>>>>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>>>> Currently, job flow control is implemented simply by limiting the amount
>>>>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>>>>> submission limit that corresponds to a certain amount of jobs.
>>>>>>>
>>>>>>> This implies that for each job drivers need to account for the maximum
>>>>>>> job size possible in order to not overflow the ring buffer.
>>>>>>>
>>>>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>>>>> rather large range. For such drivers it can easily happen that job
>>>>>>> submissions not even filling the ring by 1% can block subsequent
>>>>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>>>>
>>>>>>> In order to overcome this issue, allow for tracking the actual job size
>>>>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>>>>> submission units, which represents the amount of units a job contributes
>>>>>>> to the scheduler's submission limit.
>>>>>> As mentioned earlier, this might allow some simplifications in the
>>>>>> PowerVR driver where we do flow-control using a dma_fence returned
>>>>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>>>>> dynamically query the size of a job (a new hook?), instead of having the
>>>>>> size fixed at creation time, because PVR jobs embed native fence waits,
>>>>>> and the number of native fences will decrease if some of these fences
>>>>>> are signalled before ->run_job() is called, thus reducing the job size.
>>>>> Exactly that is a little bit questionable since it allows for the device
>>>>> to postpone jobs infinitely.
>>>>>
>>>>> It would be good if the scheduler is able to validate if it's ever able
>>>>> to run the job when it is pushed into the entity.
>>>> Yes, we do that already. We check that the immutable part of the job
>>>> (everything that's not a native fence wait) fits in the ringbuf.
>>>
>>> Yeah, but thinking more about it there might be really bad side effects. We shouldn't use a callback nor job credits because it might badly influence fairness between entities.
>>>
>>> In other words when one entity submits always large jobs and another one always small ones then the scheduler would prefer the one which submits the smaller ones because they are easier to fit into the ring buffer.
>>
>> That's true. Admittedly I mostly had DRM_SCHED_POLICY_SINGLE_ENTITY​ in mind
>> where obviously we just have a single entity.
> 
> I also only stumbled over it after thinking Boris suggestions through. That problem really wasn't obvious.
> 
>>
>>>
>>> What we can do is the follow:
>>> 1. The scheduler has some initial credits it can use to push jobs.
>>> 2. Each scheduler fence (and *not* the job) has a credits field of how much it will use.
>>> 3. After letting a a job run the credits of it's fence are subtracted from the available credits of the scheduler.
>>> 4. The scheduler can keep running jobs as long as it has a positive credit count.
>>> 5. When the credit count becomes negative it goes to sleep until a scheduler fence signals and the count becomes positive again.
>>
>> Wouldn't it be possible that we overflow the ring with that or at least end up in
>> a busy wait in run_job()? What if the remaining credit count is greater than 0 but
>> smaller than the number of credits the next picked job requires?
> 
> The initial credits the scheduler gets should be only halve the ring size.

Ok, with that premise it works. I'd be fine with that, although this means that as soon
as we hit RING_SIZE / 2 + 1 credits we don't push more stuff to the ring even if it would
actually fit.

> So as long as that is positive you should have enough space even for the biggest jobs.
> 
> We should still have a warning if userspace tries to push something bigger into an entity.

Well, if the driver thinks it's fine and it won't exceed the capacity once it hits run_job()
it's probably fine thinking of PowerVR. However, we can have a warning when run_job() returns
with more credits than we can handle.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> This way jobs are handled equally, you can still push jobs up to at least halve your ring buffer size and you should be able to handle your PowerVR case by calculating the credits you actually used in your run_job() callback.
>>>
>>> As far as I can see that approach should work, shouldn't it?
>>>
>>> Regards,
>>> Christian.
>>>
>>
> 

