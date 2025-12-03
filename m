Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43041C9D729
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 01:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7900310E620;
	Wed,  3 Dec 2025 00:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="MVb/AkEN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1407410E620
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 00:40:56 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-643165976dcso2305a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 02 Dec 2025 16:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764722454; x=1765327254;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
 b=MVb/AkENAtl1sjS1nw6mFW2m2O8JWyj6tkN7Q+n7Zm2sn/8IMTJ2mXOic61j/GZent
 SUC96ZoR6olNoxT2D89gTEAeh3q24Dh89d+wE0wHDLX2uhiDmVVyTZORajJu/oLP/UMT
 ZqNljoGmyDpLKzDF/7h8oohuddFlKPSjH4RsO67ZF0SN+OZUOKBQHwQxxDb/mk/2bJ9o
 aqWj2Vq16s1b3aw/caorK80reh/gHU0Ks+nm43SygpBGGohJyxRvDkvQyp6cf1U7W+Jb
 lwUdmYIv0f1noNfhe8dabi/dtZXummUJS45ySSU7AegrnQ/i4SChqMw0l/66E8TDZ6b+
 DrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764722454; x=1765327254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B3Oc4D01w5dnpG7EGuBSSV6W8GNHvTw+m8MC7UWCybk=;
 b=mOe9/PIyTSpvsQsLVrfY6YJihPaXgY28ew4FSeQNarwNlCHY+OQat2OxTIG501n8AP
 ZBCff+JxFttY7cVlfDFKW7pjJ1Ueut+mTooNYqQtNwWfpHKfmsQEnXnNo7RDbQwHWQpH
 qe28Y7WZbhzYRP0WbxfSyY1rFuqp1T81MFUTLnKYMa13WcdmylxmG9s672q7mnijByH0
 aWMP/Wmss9C93qGtMo6uBaNeLOsoNkRJZ77ddnenUR1zq01PNrBcIOuWZWmEWIlq8q+j
 Ui3pMacSCyx1xtvFS//UbJWOk6CVNyi9IYFNTYUTHHn2rabekayp7RerOI1X1da7F3G0
 WCZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSGUpWXNYtTpHSy6Ri4Q544Lejguj8G1qpKiN2uXxfU253VDzIFpR1mwWCdIUm0Xll2ObndvcM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjCsNvMka6m5ibYaJmyZI+XlQOGx3r7D4Pxc3kjcnOGjSsLJjs
 PAvU8z0Fmxpv6w6D+eMyH5OYMBL3XbSNgHHL/j1Gse/2asM2eFCIakADfD/sY4pOUlisnH87Ceq
 XOyVgH0FwBZTpb+0mLxIu4te3yS65CqgiEdO5GfmJ
X-Gm-Gg: ASbGncvotHJc2AHnzYiDA0cTHbrBqhHbc3ha0HhTAvx4z2zVqBfQWNwKWtKA2eQa+sB
 vnYoeIM4eMfrAdza0waaN5k5JNXIGkOdJTkj9xPVNDHycaBqpioXSw4F+aqZwP+/4+QZICnL/Wg
 4ViH8ZG4GtorW4TGJoKQlYfC05J1eBNjMCIXRJZuxWeWngFFz7rHt9x2tywArcAYUBj690YlTst
 XYqSdF6Nj2A07vSGPJ+OMASyVvfYwh4h/SkaPo0M4JKaOteMjqwJUNGpFQHveOAp9T4N89qznJt
 kQL03irFy2b72iq6LowC/sdH8c0xFHKaYVXaKM0=
X-Google-Smtp-Source: AGHT+IGUpO0L+WhI58F9++W1H/peDm2X2DnX35lpzSJlaDsXJA8kDOMd11eAqj6cUIz2+cVg+h2Z9la6R9E/O0WsxH0=
X-Received: by 2002:a05:6402:2183:10b0:640:914c:ab91 with SMTP id
 4fb4d7f45d1cf-6479b43672fmr9260a12.3.1764722454227; Tue, 02 Dec 2025 16:40:54
 -0800 (PST)
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 2 Dec 2025 16:40:41 -0800
X-Gm-Features: AWmQ_blBVdIJYux_tf6OFeNJfOnc6oPyFKVIBlfORGWG1BYJoNUf8x7Y_xiutHA
Message-ID: <CAGSQo01=7YDfYzbjipNtsK8AzXciSpY+v53kAhh+oZ_QisAh4Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Dec 2, 2025 at 12:28=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> From: Gary Guo <gary@garyguo.net>
>
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
>
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.

I've filed a PR with LLVM [1] to clarify that this is the intended
operation of the tool.

[1]: https://github.com/llvm/llvm-project/pull/170397

>
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.
>
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we suppress the warning.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 15 +++++++++++++++
>  rust/Makefile          | 26 ++++++++++++++++++++++----
>  rust/exports.c         |  5 ++++-
>  scripts/Makefile.build |  5 ++++-
>  5 files changed, 48 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328d=
ccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY             =3D $(LLVM_PREFIX)llvm-objcopy$(L=
LVM_SUFFIX)
>  OBJDUMP                =3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF                =3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP          =3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK      =3D $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS                =3D $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
>  else
>  CC             =3D $(CROSS_COMPILE)gcc
>  LD             =3D $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP :=3D 1
>  export CLIPPY_CONF_DIR :=3D $(srctree)
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COM=
PILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDG=
EN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX=
 YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd=
12dfd99d59f5080 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
>
>           If unsure, say N.
>
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    depends on EXPERT
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files di=
rectly,
> +        rustc is asked to produce LLVM IR, which is then linked together=
 with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +
>  endmenu # "Rust"
>
>  endmenu # Kernel hacking
> diff --git a/rust/Makefile b/rust/Makefile
> index d7d19c21b671dea10242b1772a8bcf0bf5dcc1cd..2344e2662ce29280582215954=
132c09f63cd8c9d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -6,15 +6,19 @@ rustdoc_output :=3D $(objtree)/Documentation/output/rus=
t/rustdoc
>  obj-$(CONFIG_RUST) +=3D core.o compiler_builtins.o ffi.o
>  always-$(CONFIG_RUST) +=3D exports_core_generated.h
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +always-$(CONFIG_RUST) +=3D helpers/helpers.bc
> +else
> +obj-$(CONFIG_RUST) +=3D helpers/helpers.o
> +always-$(CONFIG_RUST) +=3D exports_helpers_generated.h
> +endif
>  # Missing prototypes are expected in the helpers since these are exporte=
d
>  # for Rust only, thus there is no header nor prototypes.
> -obj-$(CONFIG_RUST) +=3D helpers/helpers.o
>  CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-decla=
rations
>
>  always-$(CONFIG_RUST) +=3D bindings/bindings_generated.rs bindings/bindi=
ngs_helpers_generated.rs
>  obj-$(CONFIG_RUST) +=3D bindings.o pin_init.o kernel.o
> -always-$(CONFIG_RUST) +=3D exports_helpers_generated.h \
> -    exports_bindings_generated.h exports_kernel_generated.h
> +always-$(CONFIG_RUST) +=3D exports_bindings_generated.h exports_kernel_g=
enerated.h
>
>  always-$(CONFIG_RUST) +=3D uapi/uapi_generated.rs
>  obj-$(CONFIG_RUST) +=3D uapi.o
> @@ -468,6 +472,13 @@ $(obj)/bindings/bindings_helpers_generated.rs: priva=
te bindgen_target_extra =3D ;
>  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c =
FORCE
>         $(call if_changed_dep,bindgen)
>
> +quiet_cmd_rust_helper =3D HELPER  $@
> +      cmd_rust_helper =3D \
> +       $(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)=
) -c -g0 $< -emit-llvm -o $@
> +
> +$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
> +       +$(call if_changed_dep,rust_helper)
> +
>  rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && =
$$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
>
>  quiet_cmd_exports =3D EXPORTS $@
> @@ -547,11 +558,13 @@ quiet_cmd_rustc_library =3D $(if $(skip_clippy),RUS=
TC,$(RUSTC_OR_CLIPPY_QUIET)) L
>         OBJTREE=3D$(abspath $(objtree)) \
>         $(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>                 $(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_=
flags) \
> -               --emit=3Ddep-info=3D$(depfile) --emit=3Dobj=3D$@ \
> +               --emit=3Ddep-info=3D$(depfile) --emit=3D$(if $(link_helpe=
r),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) \
>                 --emit=3Dmetadata=3D$(dir $@)$(patsubst %.o,lib%.rmeta,$(=
notdir $@)) \
>                 --crate-type rlib -L$(objtree)/$(obj) \
>                 --crate-name $(patsubst %.o,%,$(notdir $@)) $< \
>                 --sysroot=3D/dev/null \
> +       $(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnin=
gs $(patsubst %.o,%.bc,$@) $(obj)/helpers/helpers.bc -o $(patsubst %.o,%.m.=
bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
>         $(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
>         $(cmd_objtool)
>
> @@ -678,4 +691,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_as=
m.rs $(obj)/kernel/generate
>  endif
>  endif
>
> +ifdef CONFIG_RUST_INLINE_HELPERS
> +$(obj)/kernel.o: private link_helper =3D 1
> +$(obj)/kernel.o: $(obj)/helpers/helpers.bc
> +endif
> +
>  endif # CONFIG_RUST
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb=
9b7e054a28c3c21 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -16,10 +16,13 @@
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sy=
m)
>
>  #include "exports_core_generated.h"
> -#include "exports_helpers_generated.h"
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
>
> +#ifndef CONFIG_RUST_INLINE_HELPERS
> +#include "exports_helpers_generated.h"
> +#endif
> +
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d0ee33a487be95f8ba9a5c964ebecfbebc6c4bf8..04eaf2b4fbca2245f904a6dc7=
875cb3275aa7df6 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -343,7 +343,10 @@ rust_common_cmd =3D \
>  # would not match each other.
>
>  quiet_cmd_rustc_o_rs =3D $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
> -      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3Dobj=3D$@ $< $(cmd_o=
bjtool)
> +      cmd_rustc_o_rs =3D $(rust_common_cmd) --emit=3D$(if $(CONFIG_RUST_=
INLINE_HELPERS),llvm-bc=3D$(patsubst %.o,%.bc,$@),obj=3D$@) $< \
> +       $(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --=
suppress-warnings $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers/helpers.b=
c -o $(patsubst %.o,%.m.bc,$@); \
> +               $(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-modul=
e -c $(patsubst %.o,%.m.bc,$@) -o $@) \
> +       $(cmd_objtool)
>
>  define rule_rustc_o_rs
>         $(call cmd_and_fixdep,rustc_o_rs)
>
> --
> 2.52.0.158.g65b55ccf14-goog
>
