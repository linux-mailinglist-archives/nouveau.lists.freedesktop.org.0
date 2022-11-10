Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275562476E
	for <lists+nouveau@lfdr.de>; Thu, 10 Nov 2022 17:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BC310E158;
	Thu, 10 Nov 2022 16:48:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3EA10E153
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 16:48:50 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 b1-20020a17090a7ac100b00213fde52d49so2032731pjl.3
 for <nouveau@lists.freedesktop.org>; Thu, 10 Nov 2022 08:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g9kSxsO17Q+SGuhgv7bQJn3B89MxfwFUgXJQwdBXWxc=;
 b=np5+c7/D+/Pe+ETkZmBCcBkcIkF9rWztcNUNpZ8fjJM55FzJgNq4nkQ3nqPKjpN1y4
 +Vz42qN8iUh+CDPgfd4HJ+e7+YwQlV2RCywPsaAB8YsN7K22LSZWTzUSOkIgU8aIF4vU
 Sg6WhOoBQQUUrmLT0u0VujZkRgeFf/Mp4HGoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g9kSxsO17Q+SGuhgv7bQJn3B89MxfwFUgXJQwdBXWxc=;
 b=YdiX9BYAGjUEsmp1dHC95u0Yfr2WOJmojDzL1oYzZoB/+WDW+URFF5zStYSbTTNmr3
 WQPGotFL5iKkepNDdymdCbQnGEKkvFre+V3J3IaqcSHSuM1d5AHlgei90891QO/XOpws
 ETbm2jdus3FoTcWIXwBlz73jNIdzknH/Zzhg3muWxlBrPkAPc3uaqkydOKRoAYWKZ5o4
 3/QvHugx+pZBX6O63iFCIYFuIT2qO1eH/vmm9ZYj9loXGsNCl1NB5+PdCzw0U/J6sEHb
 PUb7E1ryiIR2UsR81j9RJidOssr/KlboVTx0m4RXi/FZrr6v9R6GoFdk3qJYDW57XeZq
 J1Wg==
X-Gm-Message-State: ACrzQf3w+o1X0xCkklmlokknT9DArcX2ZNW1DyhAD2sRWNQEHQOxJ3/f
 p30kKBhK8odE7ab3fG6W27BgUg==
X-Google-Smtp-Source: AMsMyM46trOzdUYGkS4TOBz+lvhrf5w6Z58imMinDBIdbLY+Ryt5gQlR73fs5ggqqfV6HJyw6Yc/cw==
X-Received: by 2002:a17:902:8d8d:b0:17d:b9c:cd64 with SMTP id
 v13-20020a1709028d8d00b0017d0b9ccd64mr1509659plo.40.1668098929893; 
 Thu, 10 Nov 2022 08:48:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a63e809000000b00473c36ea150sm3597920pgh.92.2022.11.10.08.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 08:48:49 -0800 (PST)
From: coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date: Thu, 10 Nov 2022 08:48:48 -0800
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <202211100848.F4C2819BB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Nouveau] Coverity: nv50_pior_atomic_enable(): Memory - corruptions
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, linux-hardening@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221110 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 9 08:22:02 2022 +1000
    813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Coverity reported the following:

*** CID 1527268:  Memory - corruptions  (OVERRUN)
drivers/gpu/drm/nouveau/dispnv50/disp.c:1817 in nv50_pior_atomic_enable()
1811     	case DCB_OUTPUT_TMDS:
1812     		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
1813     		nvif_outp_acquire_tmds(&nv_encoder->outp, false, false, 0, 0, 0, false);
1814     		break;
1815     	case DCB_OUTPUT_DP:
1816     		ctrl |= NVDEF(NV507D, PIOR_SET_CONTROL, PROTOCOL, EXT_TMDS_ENC);
vvv     CID 1527268:  Memory - corruptions  (OVERRUN)
vvv     Overrunning array "(*nv_encoder).dp.dpcd" of 15 bytes by passing it to a function which accesses it at byte offset 15.
1817     		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
1818     		break;
1819     	default:
1820     		BUG();
1821     		break;
1822     	}

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")

Thanks for your attention!

-- 
Coverity-bot
