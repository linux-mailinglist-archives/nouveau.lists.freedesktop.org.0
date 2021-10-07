Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7498542507A
	for <lists+nouveau@lfdr.de>; Thu,  7 Oct 2021 11:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8A06E86A;
	Thu,  7 Oct 2021 09:54:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC8C6E86A
 for <nouveau@lists.freedesktop.org>; Thu,  7 Oct 2021 09:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633600470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYsNDgqbiui3+erYBj+fHVdnDaf/K4T6XT06H3ORdUE=;
 b=Rvqsbgn5sSp+NAQ5o77r8aCBKq09mOONH2h0XTZooeKB1YcDPaMLjU5SUKfFrsRq12avVT
 sGu/LgD9gJoWwLnKp3yCHpPY1IsxsTu/KsBl7XyEYlWdanipXnsAyfPLSZzwYECqTh9Ke5
 wTDAG+mkAktXeq19h4PcNVMrtS6YlFg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-VYf7glhQODOkGIA8hM1Nqw-1; Thu, 07 Oct 2021 05:54:29 -0400
X-MC-Unique: VYf7glhQODOkGIA8hM1Nqw-1
Received: by mail-ed1-f71.google.com with SMTP id
 u24-20020aa7db98000000b003db57b1688aso806edt.6
 for <nouveau@lists.freedesktop.org>; Thu, 07 Oct 2021 02:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BYsNDgqbiui3+erYBj+fHVdnDaf/K4T6XT06H3ORdUE=;
 b=hImBGgpk9hRqTpA4Tblt20pv0GO8hIalQtu9R4SN4BwPYMnLEF+AWxzlU2Fr0dzQYM
 /TbSDrlJQYF46x5xovgitUsdUQwqJKyhZ5DHpx2CxvlNncCeWwepRxYyZSknOp7q4ub4
 bHCJVM0IiACKO6D0i4TSposyHUZE81nWhSGGGy3ype0cXdpJZHM7tKdnxoMal3Xfirxd
 wjcBAWurRXzqvuz8ZESV9lviZFRyj4ou3KvStEd3vMbORPRDG1zxAzQAK96ZQkv7y4xi
 NSuCKxcvHX9TXI47fZ+EbIORKCLYoHvqHd4y8wu7kpLCqTTOULH2Pyc8ZrroTUArJ35V
 FP4g==
X-Gm-Message-State: AOAM533j4Qq78LMjoc+/N4ND9Gxp6p2Al6LP6N7pEOgbvxTGSGHbFd43
 D0DPzRgqfHPeqfzOKYYtf/Ad5hm0r7zlYjQFyhTQGQq4oKSXVZ5lLBx0vjP5RMiCCuqL/XTInS0
 282UaxrQiqMLDcag14dK28jjAhkY1TIZSRcMHPzzl8q27RWgBNEVNo0PzpEKPP3mOoDBjYRXcxO
 ZUKg==
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr4980855edu.192.1633600465017; 
 Thu, 07 Oct 2021 02:54:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx69j3FYhBuJ3MGkPxeuYahwGxCaxZ17rHAl/NxcKCyeHdXtLpj9Qiuxhifurm9qqNJ4Ssq4Q==
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr4980819edu.192.1633600464701; 
 Thu, 07 Oct 2021 02:54:24 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id gl25sm588257ejb.81.2021.10.07.02.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:54:24 -0700 (PDT)
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20211001225344.1752203-1-lyude@redhat.com>
 <a6ea3fa3-fbbd-f5e8-54ab-3929ed9f7294@redhat.com>
 <2b04c75841f4c1661c242a3371b12d52bb0573ef.camel@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6216276e-6998-cb40-3299-81ac03a1f3a9@redhat.com>
Date: Thu, 7 Oct 2021 11:54:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2b04c75841f4c1661c242a3371b12d52bb0573ef.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [Intel-gfx] [PATCH v2 0/4] drm/dp,
 drm/i915: Finish basic PWM support for VESA backlight helpers
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On 10/5/21 10:26 PM, Lyude Paul wrote:
> On Sat, 2021-10-02 at 11:14 +0200, Hans de Goede wrote:
>> Hi Lyude,
>>
>> On 10/2/21 12:53 AM, Lyude Paul wrote:
>>> When I originally moved all of the VESA backlight code in i915 into DRM
>>> helpers, one of the things I didn't have the hardware or time for
>>> testing was machines that used a combination of PWM and DPCD in order to
>>> control their backlights. This has since then caused some breakages and
>>> resulted in us disabling DPCD backlight support on such machines. This
>>> works fine, unless you have a machine that actually needs this
>>> functionality for backlight controls to work at all. Additionally, we
>>> will need to support PWM for when we start adding support for VESA's
>>> product (as in the product of multiplication) control mode for better
>>> brightness ranges.
>>>
>>> So - let's finally finish up implementing basic support for these types
>>> of backlights to solve these problems in our DP helpers, along with
>>> implementing support for this in i915. And since digging into this issue
>>> solved the last questions we really had about probing backlights in i915
>>> for the most part, let's update some of the comments around that as
>>> well!
>>
>> Backlight control is a topic which I'm reasonably familiar with,
>> do you want me to review this series for you ?
> 
> Possibly, although I definitely want to make sure that someone from Intel gets
> a chance to review this as well.

I already expected you would also want someone from Intel to take a look
as well :)

So to figure out if I have system to test this I ended up taking a close
look at the code, which was a nice learning experience. Interesting how
some panels use a combination of DCPD + pwm/gpio for enable/disable and/or
pwm for brightness level control.

I wonder though what DCPD still does if pwm is used for both the
enable/disable and brightness-level control ?

Since I was taking a close look already I decided to do turn this into
a full, the entire set looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

> I'm more curious if you might happen to have
> any systems that would be able to test this.

I don't believe I have a system where I can test this, The only systems
which I have which presumably (I did not check) use eDP / DCPD backlight
control are boring ThinkPads with only i915 gfx.

Regards,

Hans



>>> Changes:
>>> * Fixup docs
>>> * Add patch to stop us from breaking nouveau
>>>
>>> Lyude Paul (4):
>>>   drm/i915: Add support for panels with VESA backlights with PWM
>>>     enable/disable
>>>   drm/nouveau/kms/nv50-: Explicitly check DPCD backlights for aux
>>>     enable/brightness
>>>   drm/dp, drm/i915: Add support for VESA backlights using PWM for
>>>     brightness control
>>>   drm/i915: Clarify probing order in intel_dp_aux_init_backlight_funcs()
>>>
>>>  drivers/gpu/drm/drm_dp_helper.c               | 75 +++++++++++------
>>>  .../drm/i915/display/intel_dp_aux_backlight.c | 80 ++++++++++++++-----
>>>  drivers/gpu/drm/nouveau/nouveau_backlight.c   |  5 +-
>>>  include/drm/drm_dp_helper.h                   |  7 +-
>>>  4 files changed, 122 insertions(+), 45 deletions(-)
>>>
>>
> 

