Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F001F8555
	for <lists+nouveau@lfdr.de>; Sat, 13 Jun 2020 22:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73E96E49A;
	Sat, 13 Jun 2020 20:54:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB69C8912C;
 Sun, 31 May 2020 09:15:32 +0000 (UTC)
Received: by ajax-webmail-mail-app4 (Coremail) ; Sun, 31 May 2020 17:15:27
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Sun, 31 May 2020 17:15:27 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Markus Elfring" <Markus.Elfring@web.de>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
MIME-Version: 1.0
Message-ID: <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgC3WeSvddNeYbtjAA--.9579W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAggRBlZdtOY77QABsT
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbLIS07vEb7Iv0x
 C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
 bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
 CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
 xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
 07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
 AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
 6r4UMIAIbVCjxxvEw4WlV2xY6xkI7II2jI8vz4vEwIxGrwCS07vE42xK82IY6x8ErcxFaV
 Av8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lV2xY
 6I8I3I0E5I8CrVAFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14v26r106r1rMIAIbVC2zV
 AF1VAY17CE14v26r1q6r43MIAIbVCI42IY6xIIjxv20xvE14v26r1j6r1xMIAIbVCI42IY
 6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WF
 yUJwCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UYxBIdaVFxhVjvjDU=
X-Mailman-Approved-At: Sat, 13 Jun 2020 20:53:54 +0000
Subject: Re: [Nouveau] drm/nouveau/clk/gm20b: Fix memory leak in
 gm20b_clk_new()
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Kangjie Lu <kjlu@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> > I just found that clk is referenced by pclk in this function. When clk is freed,
> > pclk will be allocated in gm20b_clk_new_speedo0(). Thus we should not release clk
> > in this function and there is no bug here.
> 
> Can there be a need to release a clock object after a failed gk20a_clk_ctor() call?
> 

I think this mainly depends on pclk pointer. It seems that the caller of 
gm20b_clk_new() always expects pclk to be allocated unless it returns -ENOMEM,
which means kzalloc() failed. If gk20a_clk_ctor() never returns such an error 
code, we may need not to release this clock object.

Regards,
Dinghao
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
