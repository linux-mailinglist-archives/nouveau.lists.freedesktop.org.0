Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B200A48CF81
	for <lists+nouveau@lfdr.de>; Thu, 13 Jan 2022 01:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CB10E3DB;
	Thu, 13 Jan 2022 00:03:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3889E10E3C0
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jan 2022 02:13:34 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id e19so1804973plc.10
 for <nouveau@lists.freedesktop.org>; Tue, 11 Jan 2022 18:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zRJAt/tHSPTVX2Oe9CjAVFlJyFBtZBGpgaIpMawcKN0=;
 b=4RxLy0zrQDn0+WSP0CFdZXXeX5oeHQpZpkg+SsPqAUnR3rzhuzAVfVk2cE2cSi3GM/
 12nqowe2KjGvcMz2u6Ytddyo5/bIFMA9I68Qaux3+s0A/LhJ38Vbt3sAlpfm3/NWlL+x
 89IxuL+4rsGLoO8XMquXbuBotOSQHO+V9V17CdMQmcBtoG1PMjME2cZNGNMsyJJr7oKb
 WXEtRhwnpjexfR2kB3Hvh0jhiJV2QW5B2p63jLNd+oEv1TZulc/y2IalsebnxkgfJOQn
 ztnqLJFizV+Oy1Y0D2ZelUhQz/PSN5MtJ0wGML3rwd4NsORAqmmcQn1VHf2++83eEewo
 42mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zRJAt/tHSPTVX2Oe9CjAVFlJyFBtZBGpgaIpMawcKN0=;
 b=cNFXIh9DdWxzBARndUkYdTuhinKx8VBk4adZyQy3COrBi46m81Rhz5x4EtWOKijmiS
 svyRXkCPDrnEaFaOqpNbIZ8HpMsjtuD2oXrxUW0SNAZnAl1uYqcZn10SO5bfNKvlUtCK
 9l80A8sjPr/iiQhwEgUx/fCItz5Uk8X9m/2qLvkhWoDfVSr08ESzxm2a00T0iQ/V6C6Y
 PMj7oRO73JfzaaNJM6EBTfMi2+Ifs+9zOAAI9M012jtItBZrg88Qpsg/0fTKP6/ARUc3
 MzkVGmzIXbIC282CzLVmwHodUAUH9bsYcgplBZzfLx4X68i6vFnOfRVlviL9wf3zaG9d
 xt5Q==
X-Gm-Message-State: AOAM5305qW2Re79muwq7I3HvHpWdzMxipeFHsSPJUnKEEWIFlBExRpxR
 vhdvZRYt34Ee2HZ4fRGUmoJLnw==
X-Google-Smtp-Source: ABdhPJxT0QrQpLvM61rtdzCrVhjqlGt2/Jh6dcOGGMd3oLp7PfZbnPqkrZUsGV2wcWXHp7Nq/rNExg==
X-Received: by 2002:a63:7258:: with SMTP id c24mr6615835pgn.11.1641953613804; 
 Tue, 11 Jan 2022 18:13:33 -0800 (PST)
Received: from [10.16.129.73] (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id u20sm7947925pfi.220.2022.01.11.18.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 18:13:33 -0800 (PST)
Message-ID: <0cc8fd2b-b6c2-d2a8-7a4c-54214db3791d@igel.co.jp>
Date: Wed, 12 Jan 2022 11:13:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20211222052727.19725-1-etom@igel.co.jp>
 <OCRYf0WjHfvIDxKeXD9eR8KiweNqCTcuy5QUapIIYgtas4x2m_nNc6mDZGnhO-y1H_yYh0O8qzzgAWdExGyK-FjUExqXY1CDlCtSDevNmWg=@emersion.fr>
From: Esaki Tomohito <etom@igel.co.jp>
In-Reply-To: <OCRYf0WjHfvIDxKeXD9eR8KiweNqCTcuy5QUapIIYgtas4x2m_nNc6mDZGnhO-y1H_yYh0O8qzzgAWdExGyK-FjUExqXY1CDlCtSDevNmWg=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 13 Jan 2022 00:03:11 +0000
Subject: Re: [Nouveau] [RFC PATCH 0/3] Add support modifiers for drivers
 whose planes only support linear layout
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, etom@igel.co.jp,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Takanari Hayama <taki@igel.co.jp>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi, Simon

On 2022/01/06 8:57, Simon Ser wrote:
> Thanks for working on this! I've pushed a patch [1] to drm-misc-next which
> touches the same function, can you rebase your patches on top of it?
> 
> [1]: https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

I understand. I will rebase the patches and send.

Thanks
Tomohito Esaki
