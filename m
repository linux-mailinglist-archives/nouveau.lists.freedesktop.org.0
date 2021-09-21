Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13241610E
	for <lists+nouveau@lfdr.de>; Thu, 23 Sep 2021 16:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA0E6ED7C;
	Thu, 23 Sep 2021 14:32:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA546EA25
 for <nouveau@lists.freedesktop.org>; Tue, 21 Sep 2021 15:08:42 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g41so50184951lfv.1
 for <nouveau@lists.freedesktop.org>; Tue, 21 Sep 2021 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=c6qQrvf3lSnsNLBp4ZoIvrXNJKy1oskE/eoTqjTqYPU=;
 b=JERQTl6t6ovejORzQ8niMVPctCcCrSpu5PzPpRq21qLMzZTwwI9UoxrMIuiZNc12rm
 yB3ZK+7hx316FE3e5OJmm4Uc6uQzsqzwBFbuHa0OJZGPCxSVr2gtASPboHUfhNgNt22Q
 Wn3dcQ0pMIU7Fqn+U9Vkzyjr3te74zRxsYDPqIrBi0mORfE8IWe/XJjXHZj7UnBCevIZ
 IGtorE04/J8m3mRSd/BzXSFk23gWLEFO///fA+PEfehn65i8uLOlrt51c7cG2m3dxRqk
 +LVElnNoOUcx2rpIu1JCNO4mRn6mE9wtpYZOibcc/+8xIkMxV6Ip30/uYmRdzGAhXglz
 mMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c6qQrvf3lSnsNLBp4ZoIvrXNJKy1oskE/eoTqjTqYPU=;
 b=N0w08HBdjVpjj8KNv4YdPtzLEdi065BuhXNHgIKhvOKyFJd+zZ0+dFLRWjO0C5pmkT
 RJq2AR4Rpxm3FiHkZL1nDaVgO8/geSqOE8h0uSprHgmK7GxRmgPqjL+dXZRKYu8KE/gz
 e0AHTHtUYmkTYFXnZ7OBFPUAgU7zlcc6wHvkxS7puddIeU+dTyBNcU3Hsi+vCKfF5S70
 Vqza/gfkYIDD1leyMU+FrKLPhiWHCBA5ZF9p2K8HLnMRyoOGBdVH+AOqbM7YLMYLUbEM
 ePMM9vyawMa/hrpgo8nhZrYuvbIl4vWxyGmWgIaRmC0V25zfu1z2uUTUAkMRv2yATaGw
 Xm5w==
X-Gm-Message-State: AOAM533EN9cM9u869WRhKCuNy66xIVXP3W4lMpyJzwAOka5Twq3+1oUR
 UT/zdO2rpB08wotD9emp3aI9JAC+ZytZqPB3Tzw=
X-Google-Smtp-Source: ABdhPJythilnqntZUqQfNyGRrHAa73lStrGPt9fcuQczvP0fUdMxh4WjgYhC346qXZN88rlQYmOIMw0yxDHckAy4Gjs=
X-Received: by 2002:a05:6512:16a9:: with SMTP id
 bu41mr23085876lfb.41.1632236866088; 
 Tue, 21 Sep 2021 08:07:46 -0700 (PDT)
MIME-Version: 1.0
From: __- -__ <isapgswell@gmail.com>
Date: Tue, 21 Sep 2021 12:07:36 -0300
Message-ID: <CAN9WMdPCd3EY866WcKoJqnx=od9pOy4k5q6HM4tsr2wrZ2ZOeQ@mail.gmail.com>
To: linux-bugs@nvidia.com, nouveau@lists.freedesktop.org, 
 Dell Tech Support <technical_support@dell.com>, ubuntu-users@lists.ubuntu.com, 
 System76 <help@system76.com>
Content-Type: multipart/alternative; boundary="00000000000097b3ed05cc82c246"
X-Mailman-Approved-At: Thu, 23 Sep 2021 14:32:11 +0000
Subject: [Nouveau] nvprime
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

--00000000000097b3ed05cc82c246
Content-Type: text/plain; charset="UTF-8"

Hi,

I launch nvidia-settings; and
I launch __NV_PRIME_RENDER_OFFLOAD=1  nvidia-settings

neither
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia nvidia-settings

Sam results

Shouldn't it?

nvidia-smi nothing to show

aTI,

L. F

--00000000000097b3ed05cc82c246
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I launch nvidia-settings; and</div>=
<div>I launch=C2=A0__NV_PRIME_RENDER_OFFLOAD=3D1 =C2=A0nvidia-settings</div=
><div><br></div><div>neither=C2=A0</div><div>__NV_PRIME_RENDER_OFFLOAD=3D1 =
__GLX_VENDOR_LIBRARY_NAME=3Dnvidia nvidia-settings<br></div><div><br></div>=
<div>Sam results</div><div><br></div><div>Shouldn&#39;t it?</div><div><br><=
/div><div>nvidia-smi nothing to show</div><div><br></div><div>aTI,</div><di=
v><br></div><div>L. F</div></div>

--00000000000097b3ed05cc82c246--
