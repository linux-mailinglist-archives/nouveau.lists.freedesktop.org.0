Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84A5B4BCF
	for <lists+nouveau@lfdr.de>; Sun, 11 Sep 2022 06:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897C010E3AC;
	Sun, 11 Sep 2022 04:30:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFDE10E3AC;
 Sun, 11 Sep 2022 04:30:45 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id q21so9660601lfo.0;
 Sat, 10 Sep 2022 21:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=X5ivUekAN0+fAD88EJc1Tp5DfK9ShiN7PGoVIvmWHTk=;
 b=SF/F1NBTXeQZpKTxuzqq+tzmA/zefvP30kNFislPl/c21AQRl4fJEH3HHcLXeTofDx
 XeBgWrxCcjqp5N6EYuLpo3kslaSSphTvHrBdczZdE1upRdzx+eG57jBBVCmYMWsRkeTf
 onEDW8r5Rq0IyjslPTZsa1gjK0p2pOmrnxiOtsglzaey7ibbUcELBUw87WzQ62q10xz+
 iG/Ad9FZM+tguD8ga3HjuYqWAJbVDCLyygmqdK6iS8lzYlk3Th9tGQZEXN4T/567pNlk
 EyDl8mBGa4UJONrrP1xzVP1XyQRN2fnDJdhvXqa5oJxQUOXkOZdMEDG5Fz6RWQMtMuNZ
 ldYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=X5ivUekAN0+fAD88EJc1Tp5DfK9ShiN7PGoVIvmWHTk=;
 b=GMj8bKSROV1gcY/KSxdcQvoLEvWn6pbhv2zRtRgXJXztvydqdFgDMBLI4Pnj6PrOB4
 YQLZn5Zjg5tBSqKfCysN1ZLOUdGQlwl5jlqjnwXDPm7/hCMEv+LF3BIRuX7AyWfV4WBS
 FX4dCPSwumworEhp9jOaNjTwXehy/dFpxCZspjjNRvpvY1/yZWQj2bVbwWBTMNfBdxaG
 BGU2F0x5NveiQbHUvTDSyT8WVWKKLhbIF6Q0Lrkbb4shpul5ApSpywRzOe2MVgFZ28bL
 8KmGMke/7kWB7hhtRhUNUEGYv+N5FEQ25bVuavtjprQTl4a9QwcYGHiKxwngm6OBY/V/
 Rblw==
X-Gm-Message-State: ACgBeo3XSLolEtkk/nl9g/KXxeXd4TDUGi+lqALv5DwhTVKOWhqTGcG0
 xZhU6rktsRZoWF3B3BcHO9959mQRel9wRg==
X-Google-Smtp-Source: AA6agR4m72NSpZUn84imwDHKRYzYRKLuQBQ6rXVyBoLNtNkd1+J2xkRaAdKeYuiamtfa6MC1c9xbKg==
X-Received: by 2002:a05:6512:1586:b0:498:fa29:35ec with SMTP id
 bp6-20020a056512158600b00498fa2935ecmr3763479lfb.641.1662870643243; 
 Sat, 10 Sep 2022 21:30:43 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844?
 ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
 by smtp.googlemail.com with ESMTPSA id
 o18-20020a056512051200b00497adccecddsm469940lfb.170.2022.09.10.21.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 21:30:42 -0700 (PDT)
Message-ID: <411ebe0f-f398-8e32-ad0e-b42732aa880f@gmail.com>
Date: Sun, 11 Sep 2022 06:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909140059.g57oihcmhuym62ei@houat>
From: kFYatek <kfyatek@gmail.com>
In-Reply-To: <20220909140059.g57oihcmhuym62ei@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH v2 10/41] drm/modes: Add a function to
 generate analog display modes
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Maxime,

W dniu 9.09.2022 o 16:00, Maxime Ripard pisze:
> On Wed, Sep 07, 2022 at 11:31:21PM +0200, Mateusz Kwiatkowski wrote:
>> The "canonical" modelines (at least for vc4's VEC, see the notes below):
>>
>> - (vfp==4, vsync==6, vbp==39) for 576i
>> - (vfp==7, vsync==6, vbp==32) for 480i
>> - (vfp==5, vsync==6, vbp==28) for 486i (full frame NTSC as originally specified)
>
> It's not clear to me either how you come up with those timings?

Well, experimentally ;)

The values for 480i and 576i are the values currently used by the downstream
kernel, and those in turn has been copied from the firmware (or more precisely,
I chose them so that the PV registers end up the same as the values set by the
firmware).

I also checked with an oscilloscope that the waveforms look as they should.
VEC doesn't exactly handle the half-lines at the start and end of the odd field
right, but otherwise, the blanking and sync pulses are where they should be.

The 486i values has been constructed from the 480i ones according to the
calculations from cross-referencing SMPTE documents, see my previous e-mail.

I know this is perhaps unsatisfactory ;) I don't have access to the VC4
documentation, so this was _almost_ reverse engineering for me.

Best regards,
Mateusz Kwiatkowski
