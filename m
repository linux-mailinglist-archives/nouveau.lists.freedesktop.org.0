Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3C17939F2
	for <lists+nouveau@lfdr.de>; Wed,  6 Sep 2023 12:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A174110E5F5;
	Wed,  6 Sep 2023 10:32:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out-216.mta0.migadu.com (out-216.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::d8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DAA10E5F6
 for <nouveau@lists.freedesktop.org>; Wed,  6 Sep 2023 10:32:06 +0000 (UTC)
Message-ID: <873b331a-d0ce-658c-6daa-02bf816e92d1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693996324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H72jsdb7U3rNb35/ic0Uk5LDLM+1lISVY4eiaaElZ2c=;
 b=rO55bXhvqRITklhqNkZjQSkPpG1KsVHaGfMYcafTrMftK6rWTx5/eJVCt7+EedNgadJO9K
 gvLY4Zuh1Ca38KxnhsMFebVtH4d4slIDl1wZL5rmNlnhVv6XScdRwizbDvUn1siUGjrHuq
 qr12MxtQNmef3fK4PG/rdaAdq1P3P6Q=
Date: Wed, 6 Sep 2023 18:31:50 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Subject: Re: [Nouveau] [RFC,
 drm-misc-next v4 0/9] PCI/VGA: Allowing the user to select the
 primary video adapter at boot time
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 2023/9/6 14:45, Christian König wrote:
>> Firmware framebuffer device already get killed by the 
>> drm_aperture_remove_conflicting_pci_framebuffers()
>> function (or its siblings). So, this series is definitely not to 
>> interact with the firmware framebuffer
>> (or more intelligent framebuffer drivers).  It is for user space 
>> program, such as X server and Wayland
>> compositor. Its for Linux user or drm drivers testers, which allow 
>> them to direct graphic display server
>> using right hardware of interested as primary video card.
>>
>> Also, I believe that X server and Wayland compositor are the best 
>> test examples.
>> If a specific DRM driver can't work with X server as a primary,
>> then there probably have something wrong.
>>
>>
>>> But what's the use case for overriding this setting?
>>>
>>
>> On a specific machine with multiple GPUs mounted,
>> only the primary graphics get POST-ed (initialized) by the firmware.
>> Therefore, the DRM drivers for the rest video cards, have to choose to
>> work without the prerequisite setups done by firmware, This is called 
>> as POST.
>
> Well, you don't seem to understand the background here. This is 
> perfectly normal behavior.
>
> Secondary cards are posted after loading the appropriate DRM driver. 
> At least for amdgpu this is done by calling the appropriate functions 
> in the BIOS. 


Well, thanks for you tell me this. You know more than me and definitely have a better understanding.

Are you telling me that the POST function for AMDGPU reside in the BIOS?
The kernel call into the BIOS?
Does the BIOS here refer to the UEFI runtime or ATOM BIOS or something else?

But the POST function for the drm ast, reside in the kernel space (in other word, in ast.ko).
Is this statement correct?

I means that for ASpeed BMC chip, if the firmware not POST the display controller.
Then we have to POST it at the kernel space before doing various modeset option.
We can only POST this chip by directly operate the various registers.
Am I correct for the judgement about ast drm driver?

Thanks for your reviews.

