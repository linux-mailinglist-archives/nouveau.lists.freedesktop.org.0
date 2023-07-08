Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EC74BD77
	for <lists+nouveau@lfdr.de>; Sat,  8 Jul 2023 14:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4307110E038;
	Sat,  8 Jul 2023 12:41:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Sat, 08 Jul 2023 12:41:20 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F0C10E038
 for <nouveau@lists.freedesktop.org>; Sat,  8 Jul 2023 12:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688820077; x=1689424877; i=markus.elfring@web.de;
 bh=VOWd3ofaOz8qqB6uuUxBjPzEMmh7MMv690c0VSPed/E=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=OaIY5MbhEEgrz8ps4mZUGGPeT6Emc57wWiCTl1K0FnAePBrPcMmzkyhLkNLyw6yw/UQLaNI
 LZeHonlfhaaDeY+smHLaUUb+WfW+bMAkmGm/yk+glp1qbfdC6sRXGDwDA/RWY6EpFUcAGS525
 91SVEZxZI/jfjmZyRfyetICLEeYXzieduU3nTOmIxucOivETL0iI2vgIFDQn1OjdFodM9DaBK
 tuq7TgEYEP9nFBHy2RiNasx2SlzpwCrUDkdeN3d9lJXdgIJprM/fgWu6yDf3Zd1S2A3wZiWhY
 FMgKXzW47eCAbhEdy+AGqW+Q9bm/vRrNEJA+vJDKqRp30MjtBrlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVrg7-1qRhP43GLd-00RgA8; Sat, 08
 Jul 2023 14:28:19 +0200
Message-ID: <11855f14-bc3e-c947-c790-47d043ac920e@web.de>
Date: Sat, 8 Jul 2023 14:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20230630160645.3984596-1-kherbst@redhat.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230630160645.3984596-1-kherbst@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:34UcEa2++m5vsfYir2cGI1kLfUG2JHF6JCNLaW2Ky2lKO2eKwN3
 kVME6xU8TxoCiMIkZ4KQ9u8Yn/kfbNJ9waJibf/+woDtPZNvNizS3GRuEg6hhd9fLVPvzaW
 +huMqwqibbrddyCj5YgVYRzc3XVljUzu5YJ2EQJSCU4N1vKBVd8LyMUCLv1g2KmFSeRxb+O
 GbU1HR8BaqedGJfdxTXNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cAh+lX/4Ctg=;y0w26NWlOLu8HEj2+rSkdWev6pb
 Ij41jjFu95Ibd6/flkKg5jygPspluI19RuDd/aBuEzW7nzytZz1QEJA8QDg0t3RwlUmMVe85B
 y9R3oONtGbBpU8PICLwWxP/vMAAPzdlxOztYjEiMDwtZoXgvgYOm2JlXEZVAWgV4k8yAV1JO3
 pk2q2eYuOBVe1nCeRCe+Y7RRkHAq+/+7zhd9pG/Z69GS3wRPr3qE7rs4G7uzWclOyq7mxzbg8
 XEVk1Iv0cT56QwTUuAbIKOlPOYcVLtUOsv9m/xc+iVceUJuz/dWn8L/rKPJ6AmFOs6ZEMTvZB
 WihJaxasE61XbTJxYx/MHw1u0/NetmxfPTfLNDdMEiHrYh9CxJEKnua170Xh4kwohfF8GukGk
 jwiZVnOxuQz2dhFTB2wOpNJrBCVbZ3DO2NlADteTwxXfRbyPrJlElf9qMUFcey8IWNif25Vms
 GxRK8WSC7qKqm+BoD5qm3e868VBUQWmeY9SnuBLpXcRvMd9u6bkkr4IEOLeKSSYc6fMybX6SD
 fFCrKBf/RJaxqAmRcUrGimWdLKmrqUXHbnaGPRxJ1RtsiJuCak2C9IE3otaSnaconHXdBLOiS
 szU0wkwNpwBZBlM1oG1h/sN1AY2MhXyIY8Tdut/ARXO3BeOBKwpwULL7WeCkqEGVBDEdy8Vv1
 EhM9S6cwBNAF5QPdOxlO5U7XwJj50kVwBH55UhrAdruBl2vscnzx1syDG0bfQwbzarTM+TsnZ
 vYhb36yVjlSeXRxeuEXOcPGfWkh3FE2kyGepq3l/o1uKQCpRN2p9ZpT+6++zTKSLTlEOVHja+
 zm+b+SfLT1raQQCV9WnKgyNUPQ7cCL0Qxj0cQynchs2Uf7J9wiszp6rYc5wQuS/bScF4YeEXz
 8CvgTCKDgM1w2quGG43CkE+1VzybAfbRPJA/4c0iJXhy5QFqPTq0BY5uho/x3I0hAAFH5hwnU
 JDWHbg==
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp/g94: enable HDMI
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
Cc: LKML <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Would a corresponding imperative description be helpful also for such a small change?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n94

Regards,
Markus
