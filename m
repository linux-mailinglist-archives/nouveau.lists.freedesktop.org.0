Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163712F7E6
	for <lists+nouveau@lfdr.de>; Fri,  3 Jan 2020 13:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F527892D8;
	Fri,  3 Jan 2020 12:01:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Fri, 03 Jan 2020 12:01:28 UTC
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54371892D8
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2020 12:01:28 +0000 (UTC)
Received: from [192.168.0.115] (84-104-227-30.cable.dynamic.v4.ziggo.nl
 [84.104.227.30])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 4D45260046
 for <nouveau@lists.freedesktop.org>; Fri,  3 Jan 2020 11:53:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 4D45260046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1578052415;
 bh=fg7nD2G/mtT8SclWPiZHSmckBFvzBQbIImu8DuHZwTo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=S5sgdOmBiu6G/U6Bh/gSQwekQ5U1MpWnlPm3PH7rg89I3XykHYeDYq0MjUaz7tMbp
 3VylHatJoA8QRRYam02SaxkkDt9gtJp1QSKaPziUiAIWFj+Ph/JAIUjItrB4fAbneH
 RKPUnhtMicX3DOJ461YSSgKa1UV3PYkQiITzG2Jc=
To: nouveau@lists.freedesktop.org
References: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <79092753-40c5-75ad-7d2b-8f315b5dc61b@spliet.org>
Date: Fri, 3 Jan 2020 12:53:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1578039033-6458-1-git-send-email-wuxu.wu@huawei.com>
Content-Language: en-US
X-Spam-Status: No, score=-3.1 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on Neelix
X-Virus-Scanned: clamav-milter 0.101.5 at Neelix
X-Virus-Status: Clean
Subject: Re: [Nouveau] [PATCH] drm/nouveau/bios: fix incorrect kfree in
 platform_init
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
Content-Type: multipart/mixed; boundary="===============1718516433=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1718516433==
Content-Type: multipart/alternative;
 boundary="------------BCF5126D4EAD6874A5E08BEE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BCF5126D4EAD6874A5E08BEE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

NACK. The before and after of this patch are functionally identical. The 
if-block returns unconditionally ("return priv;"), so the kfree will 
only ever be reached if the condition in the if-statement evaluates to 
false. Explicitly writing out an else-block is thus superfluous.

Op 03-01-2020 om 09:10 schreef wuxu.wu:
> Hi, I think there has a incorrect kfree in pcirom_init function. In
> pcirom_init function priv porinter could be free only when priv != null
> and priv->rom is null.
>
> Signed-off-by: wuxu.wu <wuxu.wu@huawei.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> index 9b91da0..d776e01 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
> @@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
>   			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
>   				priv->pdev = pdev;
>   				return priv;
> +			} else {
> +			    kfree(priv);
>   			}
> -			kfree(priv);
>   		}
>   		pci_disable_rom(pdev);
>   	}

--------------BCF5126D4EAD6874A5E08BEE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="-1">NACK. The before and after of this patch are
        functionally identical. The if-block returns unconditionally
        ("return priv;"), so the kfree will only ever be reached if the
        condition in the if-statement evaluates to false. Explicitly
        writing out an else-block is thus superfluous.</font><br>
    </p>
    <div class="moz-cite-prefix">Op 03-01-2020 om 09:10 schreef wuxu.wu:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1578039033-6458-1-git-send-email-wuxu.wu@huawei.com">
      <pre class="moz-quote-pre" wrap="">Hi, I think there has a incorrect kfree in pcirom_init function. In
pcirom_init function priv porinter could be free only when priv != null
and priv-&gt;rom is null.

Signed-off-by: wuxu.wu <a class="moz-txt-link-rfc2396E" href="mailto:wuxu.wu@huawei.com">&lt;wuxu.wu@huawei.com&gt;</a>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da0..d776e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
 			    (priv-&gt;rom = pci_map_rom(pdev, &amp;priv-&gt;size))) {
 				priv-&gt;pdev = pdev;
 				return priv;
+			} else {
+			    kfree(priv);
 			}
-			kfree(priv);
 		}
 		pci_disable_rom(pdev);
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------BCF5126D4EAD6874A5E08BEE--

--===============1718516433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1718516433==--
