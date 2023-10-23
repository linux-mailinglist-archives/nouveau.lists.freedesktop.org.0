Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BD7D3E5C
	for <lists+nouveau@lfdr.de>; Mon, 23 Oct 2023 19:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900C410E228;
	Mon, 23 Oct 2023 17:54:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD32F10E228
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 17:54:25 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1caad0bcc95so21999975ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698083665; x=1698688465; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UzKVldCUJ9ZeWevn8azwPixMUStFO30ndzXDVhvBeUU=;
 b=UvGChpo/jB/gBeLdsuBuXqScHRiVCwSsBQEa5lY6FKaXm2VYgGP2P5MEUYse7M6vm5
 nNhVv6d3aync4U2AHwKv+BFklwi+zoq1MzLSb6VpcUVRveI5OEea28bPgDlPfv7pn9rp
 V100FMxT8iMOkWXgQgRMSjxaIUpN7oWphvc+av+NUkNVjFVC8wo5QmPWaWdlgs1+x7/Q
 9Khgq4F4UYP62Lk00GKEEvZTDgBM2Y0RfrCINaeGjV8OJoyAZ0uv19YMUbRVyElGx6n4
 FvesXAGnVsMJYJ+6GoYpd7jg9Tf/fYUE6oJaOlbCtyzvnwCnaS0iXnOMFh9ygXZ2iFKQ
 4Bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698083665; x=1698688465;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UzKVldCUJ9ZeWevn8azwPixMUStFO30ndzXDVhvBeUU=;
 b=bb3jUKZWOzOguwm9y8d6PCcO+zt9hLC3xySEKcP0sH/YB1ChXjHbgWvm9ONlnQnquw
 3B7MGYBGpZX5xGwICc9XampyC+Vy1s4R+pbpqyfU3fCNJ/j6XPL9PAqCfx+EAC34lh2H
 Vftzc5NB2pRqEf3amR9/tYV/fyFL7Kywiqynz1tLvRp1A1A+aQbGKL+UviN1bM/1pve/
 veSunqcbJZMPHgxfsqtN1ZZQ9Z1OxZiJXM3qp25xum0OOJ9Y+XDm5xXMdPGZ3HXKSLSN
 51odldgAWgpdKhDT1Yny8GuqybJeJ3XjBXONON1SYR67xJNWgumbiZEqUMy3iqMNOI8S
 Gh4g==
X-Gm-Message-State: AOJu0Yw3T6Agc+/PfAvFJkOfvgKUsgxgEXQELxEVw+xushpSq78Lctxm
 S3Kfs4EZn35Ok27xtEAlK3AJshO/5TVJILzKjZt6rzydEU0=
X-Google-Smtp-Source: AGHT+IFVSerTrBnyWsefZSMTtZX/vfS9aA6Ggj+7TK/rJ/xpOXrcA9yfR6hCp3oJu1ACZRv3OkI4Ao7Z5c9iueUieec=
X-Received: by 2002:a17:903:28c4:b0:1c9:db23:705f with SMTP id
 kv4-20020a17090328c400b001c9db23705fmr6704929plb.45.1698083664980; Mon, 23
 Oct 2023 10:54:24 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Randrianasulu <randrianasulu@gmail.com>
Date: Mon, 23 Oct 2023 20:54:12 +0300
Message-ID: <CA+rFky5Swae3E7jtEi-abHHd9VJ+WaQhqM99L5zP0_r-T_Yneg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a66f87060865e911"
Subject: Re: [Nouveau] How to enable OpenCL device in Clover ?
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

--000000000000a66f87060865e911
Content-Type: text/plain; charset="UTF-8"

I think you can use
NOUVEAU_ENABLE_CL=1 clpeak for example

it skips memory-hungry bandwidth test but then runs partially:

Platform: Clover
  Device: NV106
    Driver version  : 23.3.0-devel (Linux x86)
    Compute units   : 1
    Clock frequency : 512 MHz
SPIR-V WARNING:
    In file ../src/compiler/spirv/spirv_to_nir.c:4681
    Unsupported SPIR-V capability: SpvCapabilityLinkage (5)
    28 bytes into the SPIR-V binary

    Global memory bandwidth (GBPS)
      float   : nve4_launch_grid:905 - Failed to launch grid !

[..]

Single-precision compute (GFLOPS)
      float   : 80.74
      float2  : 41.38
      float4  : 50.49
      float8  : 51.32
      float16 : 53.58

on unreclocked NVIDIA GK208B (2gb ddr3 memory - ha!)

--000000000000a66f87060865e911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think you can use<div dir=3D"auto">NOUVEAU_ENABLE_CL=3D=
1 clpeak for example<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>it skips memory-hungry bandwidth test but then runs partially:</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">Platform: Clover<=
/div><div dir=3D"auto">=C2=A0 Device: NV106</div><div dir=3D"auto">=C2=A0 =
=C2=A0 Driver version=C2=A0 : 23.3.0-devel (Linux x86)</div><div dir=3D"aut=
o">=C2=A0 =C2=A0 Compute units=C2=A0 =C2=A0: 1</div><div dir=3D"auto">=C2=
=A0 =C2=A0 Clock frequency : 512 MHz</div><div dir=3D"auto">SPIR-V WARNING:=
</div><div dir=3D"auto">=C2=A0 =C2=A0 In file ../src/compiler/spirv/spirv_t=
o_nir.c:4681</div><div dir=3D"auto">=C2=A0 =C2=A0 Unsupported SPIR-V capabi=
lity: SpvCapabilityLinkage (5)</div><div dir=3D"auto">=C2=A0 =C2=A0 28 byte=
s into the SPIR-V binary</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>=C2=A0 =C2=A0 Global memory bandwidth (GBPS)</div><div dir=3D"auto">=C2=A0=
 =C2=A0 =C2=A0 float=C2=A0 =C2=A0: nve4_launch_grid:905 - Failed to launch =
grid !</div><div dir=3D"auto"><br></div><div dir=3D"auto">[..]</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div dir=3D"auto">Single-precision c=
ompute (GFLOPS)</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 float=C2=A0 =C2=
=A0: 80.74</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 float2=C2=A0 : 41.38=
</div><div dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 float4=C2=A0 : 50.49</div><div=
 dir=3D"auto">=C2=A0 =C2=A0 =C2=A0 float8=C2=A0 : 51.32</div><div dir=3D"au=
to">=C2=A0 =C2=A0 =C2=A0 float16 : 53.58</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">on unreclocked=C2=A0NVIDIA GK208B (2gb ddr3 memory - ha!)<=
/div></div></div></div>

--000000000000a66f87060865e911--
